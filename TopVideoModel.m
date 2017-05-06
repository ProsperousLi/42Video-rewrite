//
//  TopVideoModel.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "TopVideoModel.h"
#import "AppConstant.h"
@implementation TopVideoModel


-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.videoMulti = [dict valueForKeyPath:@"object.videoMulti"];
        self.name = [dict valueForKeyPath:@"object.videoMulti.name"];
        
        //对接受的image Json进行处理，使其变为新的接口(图片接口),主站加上请求到的字符串就是一个接口
        NSMutableArray *finalImage = [[NSMutableArray alloc] init];
        NSArray *image = [dict valueForKeyPath:@"object.videoMulti.preview"];
        for (NSString *imgStr in image) {
            NSString *str = Net_host;
            str = [str stringByAppendingString:imgStr];
            [finalImage addObject:str];
        }
        
        self.image = finalImage;
        
        self.VideoId = [dict valueForKeyPath:@"object.videoMulti.id"];
        
        self.typeLevel_0 = [dict valueForKeyPath:@"object.videoTypeLevel_0.name"];
        
        self.typeLevel_1 = [dict valueForKeyPath:@"object.videoTypeLevel_1.name"];
        
        self.typeLevel_2 = [dict valueForKeyPath:@"object.videoTypeLevel_2.name"];
        
        self.info = [dict valueForKeyPath:@"object.videoMulti.introduce"];
    }
    
    return self;
}

+(instancetype)initWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}



@end
