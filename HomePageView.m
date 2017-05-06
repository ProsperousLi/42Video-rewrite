//
//  HomePageView.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "HomePageView.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"

@implementation HomePageView

-(instancetype)init {
    if (self = [super init]) {
        //需要frame，否则默认为0，0，0，0；
        self.frame =[UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        
        [self addSubview:self.buttonsView];
        [self ClassificationWithButtons];
    }
    
    return self;
}


-(UIView *)buttonsView {

    _buttonsView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight/2.0 - ScreenHeight/20, ScreenWidth, ScreenWidth*(4.0/8.0))];
    _buttonsView.backgroundColor = [UIColor colorWithHex:primary_color_50_mask alpha:0.6];
    
    return _buttonsView;
}


-(void)ClassificationWithButtons {
    //按钮背景的frame，方便调用
    CGFloat buttonViewWidth = _buttonsView.frame.size.width;
    CGFloat buttonViewHeight = _buttonsView.frame.size.height;
    
    NSMutableArray * ButtonTitleArray = [[NSMutableArray alloc] initWithObjects:ButtonTitle1,ButtonTitle2,ButtonTitle3,ButtonTitle4,ButtonTitle5,ButtonTitle6,ButtonTitle7,ButtonTitle8,ButtonTitle9,ButtonTitle10, nil];  //按钮标题数组
    NSMutableArray * ButtonImageArray = [[NSMutableArray alloc] initWithObjects:latestPicture,varietyPicture,moviePicture,teleplayPicture,carttoonPicture,comedyPicture,schoolPicture,musicPicture,gymPicture,morePicture, nil];    //按钮图片数组
    
    for (int i = 0; i < 10; i++) {
        UIButton *button;
        button = [[UIButton alloc] initWithFrame:CGRectMake(buttonViewWidth/16 * ((i % 5) +1) + buttonViewWidth/8 * (i % 5), buttonViewHeight/12 + ((buttonViewHeight/5 + buttonViewHeight/4) * (i/5)), buttonViewWidth/8, buttonViewHeight/4)];  //frame
        [button setBackgroundImage:[UIImage imageNamed:[ButtonImageArray objectAtIndex:i]] forState:UIControlStateNormal]; //设置按钮的图片
        button.imageEdgeInsets = UIEdgeInsetsMake( 0,  0, button.frame.size.height* (2.0 / 10.0),  0);       //设置按钮上的图片的位置,上、左、下、右的距离
        
        [button setTitle:[ButtonTitleArray objectAtIndex:i] forState:UIControlStateNormal];  //设置按钮标题
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;  //居中
        button.titleEdgeInsets = UIEdgeInsetsMake(button.frame.size.height*(9.0/10.0), 0, 0, 0);  //设置按钮上的文字的位置
        [button setContentEdgeInsets:UIEdgeInsetsMake(button.frame.size.height*(9.0/10.0), 0, 0, 0)];//设置内容边界,设置这个上面才有效
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        button.tag = i; //设置标志tag
        
        [button addTarget:self action:@selector(classifovationButtonAction:) forControlEvents:UIControlEventTouchUpInside];  //添加点击事件
        
        [_buttonsView addSubview:button];
    }
   
}


//首页按钮响应事件
-(void)classifovationButtonAction:(UIButton *) button{
    
}

@end
