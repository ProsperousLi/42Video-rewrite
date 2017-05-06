//
//  ChannelModel.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/13.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "ChannelModel.h"
#import "AppConstant.h"
@implementation ChannelModel

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
    return [self initWithDict:dict];
}

-(NSString *)net_video_multis_StringWithType:(int)type Content:(int)content Region:(int)region Lastest:(int)lastest Hot:(int)hot Score:(int)score Page_index:(int)page_index Page_size:(int)page_size {
    NSString *str = Net_host;

    str = [str stringByAppendingString:net_video_multis_type];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",type]];
    
    str = [str stringByAppendingString:net_video_multis_content];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",content]];
    
    str = [str stringByAppendingString:net_video_multis_region];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",region]];
    
    str = [str stringByAppendingString:net_video_multis_latest];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",lastest]];
    
    str = [str stringByAppendingString:net_video_multis_hot];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",hot]];
    
    str = [str stringByAppendingString:net_video_multis_score];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",score]];
    
    str = [str stringByAppendingString:net_video_multis_page_index];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",page_index]];
    
    str = [str stringByAppendingString:net_video_multis_page_size];
    str = [str stringByAppendingString:[NSString stringWithFormat:@"%d",page_size]];
    
    return str;
}



@end
