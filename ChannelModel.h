//
//  ChannelModel.h
//  42Video-rewrite
//
//  Created by dragon on 16/5/13.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject


/**
 *  获取videoMulti为关键字和对应value，方便传到下一个view。
 */
@property (nonatomic,strong) NSMutableArray *videoMulti;


/**
 *  频道视频名称
 */
@property (nonatomic,strong) NSMutableArray *name;


/**
 *  频道视频图片
 */
@property (nonatomic,strong) NSMutableArray *image;


/**
 *  视频id
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


/**
 *  拼接接口,lastest、hot、score只能有一个为1，其他为0；page_index代表几页；page_size代表一页多少组数据
 *  @param type 0,全部；1，院内；2，电影；3，电视剧；4，动漫；5，其他
 *  @param content 0,全部；1，教育；2，综艺；3，爱情；4，动作；5，冒险；6，古装；7，喜剧；8，悬疑；9，科幻；10，魔幻；11，恐怖；12，灾难；13，文艺；14，音乐，其他。
 *  @param region 0，大陆；1，香港；2，台湾；3，美国；4，日本；5，韩国；6，澳洲；7，英国；8，印度；9，泰国；10，其他。
 *  @param lastest 0,
 */
-(NSString *)net_video_multis_StringWithType:(int)type Content:(int)content Region:(int)region Lastest:(int)lastest Hot:(int)hot Score:(int)score Page_index:(int)page_index Page_size:(int)page_size;




@end
