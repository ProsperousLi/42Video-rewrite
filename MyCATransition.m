//
//  CATransition.m
//  42centerTwo
//
//  Created by dragon on 15/11/23.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "MyCATransition.h"
#define DURATION 0.4 //动画时间


@interface CATransition ()

@end

@implementation MyCATransition




typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push = 2,                       //推挤
    Reveal = 3,                     //揭开
    MoveIn = 4,                     //覆盖
    Cube = 5,                       //立方体
    SuckEffect = 6,                 //吮吸
    OglFlip = 7,                    //翻转
    RippleEffect = 8,               //波纹
    FlipFromLeft = 9,               //左翻转
    FlipFromRight = 10,              //右翻转
    PageCurl = 11,                   //翻页
    PageUnCurl = 12,                 //反翻页
    CurlDown = 13,                   //下翻页
    CurlUp = 14,                     //上翻页
    CameraIrisHollowOpen = 15,       //开镜头
    CameraIrisHollowClose = 16,      //关镜头

    
} AnimationType;



- (void)transition:(int)transType withView:(UIView*)view andToOtherControllerType:(int)type {
    //UIButton *button = sender;
    AnimationType animationType = transType;
    NSString *subtypeString;
    _Mysubtype = type;
    switch (_Mysubtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    
    
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:view];
            break;
            
        case CurlDown:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
    

    
}



#pragma mark CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    //animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.window.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:DURATION animations:^{
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}




@end
