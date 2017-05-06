//
//  CATransition.h
//  42centerTwo
//
//  Created by dragon on 15/11/23.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCATransition : UIViewController

@property (nonatomic,assign) int Mysubtype;

/**
 * 页面跳转方式
 * @param   transType   跳转页面的动画
 * @param   view        当前控制器或者view
 * @param   type        页面跳转的方向（向上、向下、向左、向右）。0:左，1:下，2:右，3:上
 */
- (void)transition:(int)transType  withView:(UIView*)view  andToOtherControllerType:(int)type;


@end
