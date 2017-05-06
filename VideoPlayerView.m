//
//  VideoPlayerView.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "VideoPlayerView.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"
@implementation VideoPlayerView 
//ScreenHeight/7 + ScreenWidth*(9.0/16.0)
-(instancetype)init {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        //在scroll之前初始化，这样才能设置图片
        [self addSubview:self.NameLabel];
        [self addSubview:self.typeLabel];
        
        [self addSubview:self.episodeButton];
        [self addSubview:self.introduceButton];
        [self addSubview:self.videoPlayerScrollView];
        [_videoPlayerScrollView addSubview:self.textView];
        [_videoPlayerScrollView addSubview:self.buttonView];
        self.videoPlayerScrollView.delegate = self;


        
    }
    
    return self;
}

-(UILabel *)NameLabel {
    if (!_NameLabel) {
        
        _NameLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/30, ScreenWidth/20 + ScreenWidth*(9.0/16.0), 5 * ScreenWidth/8, ScreenWidth/8)];
        _NameLabel.backgroundColor = [UIColor clearColor];
        _NameLabel.textColor = [UIColor colorWithHex:main_text_title_color_dark];
    }
    
    return _NameLabel;
}

-(UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/30, ScreenHeight/10 + ScreenWidth*(9.0/16.0), ScreenWidth/2, ScreenWidth/12)];
        _typeLabel.backgroundColor = [UIColor clearColor];
        _typeLabel.textColor = [UIColor colorWithHex:main_text_title_color_lighter];
    }
    
    return _typeLabel;
}

-(UIScrollView *)videoPlayerScrollView {
    if (!_videoPlayerScrollView) {
        _videoPlayerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, ScreenHeight/7 + ScreenWidth*(9.0/16.0), ScreenWidth, ScreenHeight - ScreenHeight/7 + ScreenWidth*(9.0/16.0))]; //这个是可见的视图
        [_videoPlayerScrollView setBackgroundColor:[UIColor colorWithHex:primary_color_0]];
        _videoPlayerScrollView.pagingEnabled = YES;      //分页滚动
        _videoPlayerScrollView.scrollEnabled = YES;      //可滚动
        _videoPlayerScrollView.canCancelContentTouches = NO;  //可手势滚动
        _videoPlayerScrollView.bounces = NO;   //回弹效果
        _videoPlayerScrollView.showsHorizontalScrollIndicator = NO;  //水平滚动条
        _videoPlayerScrollView.showsVerticalScrollIndicator = YES;  //竖直滚动条
        [_videoPlayerScrollView setContentSize:CGSizeMake(ScreenWidth * 2, ScreenHeight + ScreenHeight/7 - ScreenHeight/7 + ScreenWidth*(9.0/16.0))]; //这个是滚动的视图
        _videoPlayerScrollView.directionalLockEnabled = YES; //设置每次只能朝一个方向滚动


        
    }
    
    return _videoPlayerScrollView;
}

//ScrollView代理

//目的在于使按钮状态改变
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset; //得到当前滚动的位置
    //NSLog(@"%f",point.x);
    if (point.x > ScreenWidth*(9.0/10.0)) {  //如果大于一个9/10屏幕宽，说明到了简介页
        [_introduceButton setBackgroundImage:[UIImage imageNamed:@"icon_episodes _info.png"] forState:UIControlStateNormal]; //设置按钮背景图片
        [_episodeButton setBackgroundImage:[UIImage imageNamed:@"icon_episode.png"] forState:UIControlStateNormal];
    }
    else if (point.x <= ScreenWidth/10.0) { //如果小于1/3，说明到了剧集页
        [_episodeButton setBackgroundImage:[UIImage imageNamed:@"icon_episodes.png"] forState:UIControlStateNormal];
        [_introduceButton setBackgroundImage:[UIImage imageNamed:@"icon_detail.png"] forState:UIControlStateNormal];
    }
}

-(UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight - ScreenHeight/7 + ScreenWidth*(9.0/16.0))];
        _textView.backgroundColor = [UIColor colorWithHex:primary_color_0];
    }
    
    return _textView;
}

-(UIView *)buttonView {
    
    if (!_buttonView) {
        _buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenHeight/7 + ScreenWidth*(9.0/16.0))];
        _buttonView.backgroundColor = [UIColor clearColor];
    }
    
    return _buttonView;
}

-(UIButton *)episodeButton {
    if (!_episodeButton) {
        _episodeButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/30+ 5 * ScreenWidth/8, ScreenWidth/20 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        [_episodeButton setBackgroundImage:[UIImage imageNamed:@"icon_episodes.png"] forState:UIControlStateNormal];
        [_episodeButton addTarget:self action:@selector(episodeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _episodeButton;
}

-(UIButton *)introduceButton {
    if (!_introduceButton) {
        _introduceButton = [[UIButton alloc] initWithFrame:CGRectMake(3 * ScreenWidth/30+ 6 * ScreenWidth/8, ScreenWidth/20 + ScreenWidth*(9.0/16.0), ScreenWidth/8, ScreenWidth/8)];
        [_introduceButton setBackgroundImage:[UIImage imageNamed:@"icon_detail.png"] forState:UIControlStateNormal]; //设置按钮背景图片
        [_introduceButton addTarget:self action:@selector(introduceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _introduceButton;
}

//剧集按钮响应事件
-(void)episodeButtonAction :(UIButton *)button {
    [_episodeButton setBackgroundImage:[UIImage imageNamed:@"icon_episodes.png"] forState:UIControlStateNormal];
    [_introduceButton setBackgroundImage:[UIImage imageNamed:@"icon_detail.png"] forState:UIControlStateNormal];
    [_videoPlayerScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
}

-(void)introduceButtonAction :(UIButton *)button {
    [_introduceButton setBackgroundImage:[UIImage imageNamed:@"icon_episodes _info.png"] forState:UIControlStateNormal]; //设置按钮背景图片
    [_episodeButton setBackgroundImage:[UIImage imageNamed:@"icon_episode.png"] forState:UIControlStateNormal];
    [_videoPlayerScrollView setContentOffset:CGPointMake(ScreenWidth , 0) animated:NO];
}


@end
