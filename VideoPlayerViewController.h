//
//  VideoPlayerViewController.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayerView.h"
#import "KrVideoPlayerController.h"
#import "VideoPlayerModel.h"
@interface VideoPlayerViewController : UIViewController 

/**
 * 播放器view的声明
 */
@property (nonatomic,strong) VideoPlayerView * videoPlayerView;


/**
 * 第三方播放器类的声明
 */
@property (nonatomic, strong) KrVideoPlayerController  *krVideoPlayerController;


/**
 * 从首页传来的视频Id
 */
@property (nonatomic,strong) NSString *videoId;


/**
 * fileId
 */
@property (nonatomic,strong) NSMutableArray *fileId;

/**
 * videoPlayer模型的声明
 */
@property (nonatomic,strong)VideoPlayerModel *model;



/**
 * 从首页传来的name
 */
@property (nonatomic,strong) NSString *name;


/**
 * 从首页传来的type
 * @param typeLevel_0 电影、电视剧。。
 */
@property (nonatomic,strong) NSString *typeLevel_0;

/**
 * 从首页传来的type
 * @param typeLevel_2 地区
 */
@property (nonatomic,strong) NSString *typeLevel_2;


/**
 * 从首页传来的info,简介
 */
@property (nonatomic,strong)NSString *introduce;

/**
 *  创建剧集数按钮，显示在播放器下方
 *
 *  @param EpisodeId   剧集数
 *  @param number      每行显示多少按钮
 */
-(void)setEpisodeButton:(int)EpisodeId WithRowOfButtonNumber:(int)number;

/**
 *  navagationBar被隐藏了，所以自定义一个返回按钮，
 */
@property (nonatomic,strong) UIButton *backButton;



@end
