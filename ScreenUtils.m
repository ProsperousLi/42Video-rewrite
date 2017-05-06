//
//  ScreenUtils.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/10.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "ScreenUtils.h"
#import <UIKit/UIKit.h>
static const int pixelWidth = 640;
//static const int pixelHeight = 1136;

@implementation ScreenUtils

+(double)convertLength:(double)length {
    CGSize size = [UIScreen mainScreen].bounds.size;
    float scale = [UIScreen mainScreen].scale;
    double factor = (size.width*scale)/pixelWidth;
    return length * factor;
}


@end
