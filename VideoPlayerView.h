//
//  VideoPlayerView.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayerModel.h"

@interface VideoPlayerView : UIView <UIScrollViewDelegate>

/**
 *  VideoPlayerModel
 *
 */
@property (nonatomic,strong) VideoPlayerModel *model;

/**
 *  名称显示,label
 *
 */
@property (nonatomic,strong) UILabel *NameLabel;

/**
 *  类型显示，label
 *
 */
@property (nonatomic,strong) UILabel *typeLabel;


/**
 *  scrollView,加载剧集和简介
 *
 */
@property (nonatomic,strong) UIScrollView *videoPlayerScrollView;


/**
 *  scrollView剧集按钮，button。其实就是点击后使scrollView翻到第一页
 */
@property (nonatomic,strong) UIButton *episodeButton;


/**
 *  scrollView简介按钮，button。其实就是点击后使scrollView翻到第二页
 */
@property (nonatomic,strong) UIButton * introduceButton;

/**
 *  显示简介,textView
 */
@property (nonatomic,strong) UITextView *textView;

/**
 *  存放button 的视图
 */
@property (nonatomic,strong) UIView *buttonView;


@end
