//
//  TopVideoModel.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopVideoModel : NSObject

/**
 *  获取videoMulti为关键字和对应value，方便传到下一个view。
 */
@property (nonatomic,strong) NSMutableArray *videoMulti;


/**
 *  top首页的视频名称
 */
@property (nonatomic,strong) NSMutableArray *name;


/**
 * top的视频图片
 */
@property (nonatomic,strong) NSMutableArray *image;


/**
 * top的id
 */
@property (nonatomic,strong) NSMutableArray *VideoId;


/**
 * top的视频类型
 */
@property (nonatomic,strong)NSMutableArray *typeLevel_0;


/**
 * top的视频类型
 */
@property (nonatomic,strong)NSMutableArray *typeLevel_1;


/**
 * top的视频类型
 */
@property (nonatomic,strong)NSMutableArray *typeLevel_2;


/**
 * top的视频简介
 */
@property (nonatomic,strong) NSMutableArray *info;


/**
 * 对象的初始化方法
 * 在自己的类中调用
 * @param dict  要传入的字典（网络请求的数据）
 */
-(instancetype)initWithDict:(NSDictionary *)dict;


/**
 * 类的初始化方法
 * 直接声明类就可调用
 * @param dict  要传入的字典（网络请求的数据）
 */
+(instancetype)initWithDict:(NSDictionary *)dict;

@end
