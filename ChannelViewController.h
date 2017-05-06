//
//  ChannelViewController.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelView.h"
#import "ChannelModel.h"
#import "VideoPlayerViewController.h"

@interface ChannelViewController : UIViewController<UIScrollViewDelegate>

/**
 *  频道页的view
 *  ChannelView的声明
 */
@property (nonatomic,strong) ChannelView *channelView;


/**
 *  视频播放控制器VideoPlayerViewController的声明
 */
@property (nonatomic,strong) VideoPlayerViewController *videoPlayerViewController;

@end
