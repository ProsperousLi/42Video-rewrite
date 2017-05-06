//
//  ChannelView.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/10.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ChannelView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,SDWebImageManagerDelegate>

/**
 *  标题
 */
@property (nonatomic,strong) UILabel *titleLabel;

/**
 *  频道，最新视频，按钮
 */
@property (nonatomic,strong) UIButton *latestButton;


/**
 *  视频度最热，按钮
 */
@property (nonatomic,strong) UIButton *hotButton;


/**
 *  视频评分，按钮
 */
@property (nonatomic,strong) UIButton *sorceButton;


/**
 *  筛选按钮
 */
@property (nonatomic,strong) UIButton *SelectionButton;


/**
 *  自定义navagationBar
 */
@property (nonatomic,strong) UINavigationBar *navigationBar;


/**
 *  频道collectionCell
 */
@property (nonatomic,strong)UICollectionView *collectionView;


/**
 *  水平滚动视图
 */
@property (nonatomic,strong)UIScrollView *horizontaView;


/**
 *  最新按钮回调方法
 */
@property (nonatomic, copy)void(^latestButtonAction)(void);


/**
 *  最热按钮回调方法
 */
@property (nonatomic, copy)void(^hotButtonAction)(void);


/**
 *  评分按钮回调方法
 */
@property (nonatomic, copy)void(^sorceButtonAction)(void);


/**
 *  筛选按钮回调方法
 */
@property (nonatomic,strong)void(^selectionButtoinAction)(void);


/**
 *  cell点击回调方法
 */
@property (nonatomic,strong)void (^cellDidSelectAction)(NSInteger index);

/**
 *  频道页的数据
 *  ChannelModel的声明
 */
@property (nonatomic,strong) ChannelModel *model;


/**
 *  silderView右侧的菜单view
 */
@property (nonatomic,strong) UIView *rightView;





/**
 *  collectionView初始化
 *  @param width 水平位移
 */
-(UICollectionView *)collectionView:(CGFloat)width;


/**
 * 请求最热网络数据
 */
-(void)getLastestDataFromHttp;



@end
