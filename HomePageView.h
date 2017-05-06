//
//  HomePageView.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HomePageView : UIView

/**
 * 分类按钮的背景图片
 */
@property (nonatomic,strong) UIView *buttonsView;


/**
 * 首页10个按钮的布局,分类按钮
 */
-(void)ClassificationWithButtons;




@end
