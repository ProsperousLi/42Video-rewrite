//
//  VideoPlayerModel.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "VideoPlayerModel.h"

@implementation VideoPlayerModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.fileId = [dict valueForKeyPath:@"object.fileId"];
        NSMutableArray *episodeId = [dict valueForKeyPath:@"object.episodeId"];
        self.episodeId = [episodeId objectAtIndex:0]; //在网络请求里面使用循环的后果
    }
    
    return self;
}

+(instancetype)initWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}


@end
