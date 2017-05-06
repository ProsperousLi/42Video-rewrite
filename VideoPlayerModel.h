//
//  VideoPlayerModel.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoPlayerModel : NSObject

/**
 *  视频的fileId
 */
@property (nonatomic,strong) NSMutableArray *fileId;


/**
 *  视频的episodeId,剧集数,可用于创建按钮
 */
@property (nonatomic,strong) NSString *episodeId;


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
