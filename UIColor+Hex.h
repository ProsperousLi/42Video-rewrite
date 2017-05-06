//
//  UIColor+Hex.h
//  42Certer-Three
//
//  Created by dragon on 16/4/17.
//  Copyright © 2016年 dragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  扩展UIColor，使0x??????等十六进制颜色转换成系统的RGB
 *  @param  hexColor  十六进制参数.例如:0x??????
 */
+ (UIColor *)colorWithHex:(long)hexColor;

/**
 *  扩展UIColor，使0x??????等十六进制颜色转换成系统的RGBA
 *  @param  hexColor  十六进制参数.例如:0x??????
 *  @param  opacity   alpha,透明度:0.0～1.0
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
