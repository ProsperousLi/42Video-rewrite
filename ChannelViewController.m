//
//  ChannelViewController.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "ChannelViewController.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"

@interface ChannelViewController ()

@end

@implementation ChannelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _channelView = [[ChannelView alloc] init];
    [self.view addSubview:_channelView];  //初始化并加入到控制器上
    
    _channelView.horizontaView.delegate = self;
    
    [self blockWithButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//按钮回调的方法
-(void)blockWithButtons {
    __weak typeof(self)weakSelf = self; //弱引用
    
    //回调方法
    _channelView.latestButtonAction = ^() {
        
        [weakSelf.channelView.collectionView reloadData];
        
        [weakSelf.channelView.latestButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
        [weakSelf.channelView.hotButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [weakSelf.channelView.sorceButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        
        [weakSelf.channelView.horizontaView setContentOffset:CGPointMake(0, 0)];
    };
    
    _channelView.hotButtonAction = ^() {
        [weakSelf.channelView.hotButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
        [weakSelf.channelView.latestButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [weakSelf.channelView.sorceButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        
        [weakSelf.channelView.horizontaView setContentOffset:CGPointMake(ScreenWidth, 0)];
    };
    
    _channelView.sorceButtonAction = ^() {
        [weakSelf.channelView.sorceButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
        [weakSelf.channelView.latestButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [weakSelf.channelView.hotButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        
        [weakSelf.channelView.horizontaView setContentOffset:CGPointMake(ScreenWidth * 2, 0)];
    };
    
    
    //cell回调函数
    _channelView.cellDidSelectAction = ^(NSInteger index) {
        //NSLog(@"%@",)
        //传数据到视频播放viewController
        
        _videoPlayerViewController = [[VideoPlayerViewController alloc] init];
        
        _videoPlayerViewController.videoId = [weakSelf.channelView.model.VideoId objectAtIndex:index];
        _videoPlayerViewController.name = [weakSelf.channelView.model.name objectAtIndex:index];
        _videoPlayerViewController.typeLevel_0 = [weakSelf.channelView.model.typeLevel_0 objectAtIndex:index];
        _videoPlayerViewController.typeLevel_2 = [weakSelf.channelView.model.typeLevel_2 objectAtIndex:index];
        _videoPlayerViewController.introduce = [weakSelf.channelView.model.info objectAtIndex:index];
        
        [self.navigationController pushViewController:_videoPlayerViewController animated:NO];
    };
}

#pragma mark - scrollViewDelegate

//滚动时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    if (_channelView.horizontaView) {
        if (point.x <= ScreenWidth/2) {
            [_channelView.latestButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
            [_channelView.hotButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
            [_channelView.sorceButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];

        }
        else if (point.x > ScreenWidth/2 && point.x <= ScreenWidth * 3.0/2.0) {

            [_channelView.hotButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
            [_channelView.latestButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
            [_channelView.sorceButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        }
        else if (point.x > ScreenWidth * 3.0/2.0) {
            [_channelView.sorceButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
            [_channelView.latestButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
            [_channelView.hotButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        }
    }
}





@end
