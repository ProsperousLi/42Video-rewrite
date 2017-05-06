//
//  HomePageViewController.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRCarouselView.h"
#import "HomePageView.h"
#import "TopVideoModel.h"
#import "VideoPlayerViewController.h"
@interface HomePageViewController : UIViewController<XRCarouselViewDelegate>
/**
 *  首页HomePageView的声明
 */
@property (nonatomic,strong) HomePageView *homePageView;

/**
 *  视频播放控制器VideoPlayerViewController的声明
 */
@property (nonatomic,strong) VideoPlayerViewController *videoPlayerViewController;


/**
 *  轮播图片类的声明
 */
@property (nonatomic,strong) XRCarouselView *carouselView;


/**
 *  请求top网络接口
 */
-(void)GetTopDataFromHttp;


/**
 *  模型的声明
 */
@property (nonatomic,strong) TopVideoModel *model ;


/**
 *  不是属性，是方法,传首页推荐图片数组和描述数组
 *
 *  @param picturesArray 图片数组
 *  @param describeArray 描述数组
 */
-(void)carouselView:(NSMutableArray *)picturesArray WithdescribeArray:(NSMutableArray *)describeArray;

@end
