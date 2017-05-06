//
//  TabBarController.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayerViewController.h"

@interface TabBarController : UITabBarController<UITabBarControllerDelegate>

/**
 *添加别的视图控制器到本视图控制器
 */
-(void)addOtherControllerToTabBarController;

/**
 *  第三方播放器
 */
@property(nonatomic,strong) VideoPlayerViewController *videoPlayerViewController;


@end
