//
//  HomePageViewController.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "HomePageViewController.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"
#import "TopVideoModel.h"
#import <AFNetworking/AFNetworking.h>
#import "LPRefresh.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //初始化视频播放控制器
    _videoPlayerViewController = [[VideoPlayerViewController alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _homePageView = [[HomePageView alloc] init]; //在这初始化，然后后面的方法里都用这个实例
    [self.view addSubview:_homePageView];
    [self GetTopDataFromHttp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/**
 *  不是属性，是方法,传首页推荐图片数组和描述数组
 */
-(void)carouselView:(NSArray *)picturesArray WithdescribeArray:(NSArray *)describeArray {
    //初始化,传两个数组,分别是图片数组和描述数组
    self.carouselView = [XRCarouselView carouselViewWithImageArray:picturesArray describeArray:describeArray];
    
    //设置frame
    self.carouselView.frame = CGRectMake(0, 64, ScreenWidth, ScreenWidth/16*9);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
    
    //用代理处理图片点击，如果两个都实现，block优先级高于代理
    self.carouselView.delegate = self;
    
    //设置每张图片的停留时间
    _carouselView.time = 2;
    //设置分页控件的图片,不设置则为系统默认
    //[_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentImage:[UIImage imageNamed:@"current"]];
    //设置分页控件的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomRight;
    
    
    //设置背景颜色，默认为黑色半透明
    _carouselView.desLabelBgColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    //设置字体，默认为13号字体
    _carouselView.desLabelFont = [UIFont systemFontOfSize:16];
    //设置文字颜色，默认为白色
    _carouselView.desLabelColor = [UIColor colorWithHex:primary_color_500_mask];
    
    [_homePageView addSubview:_carouselView];
    
}


//代理方法，可以处理图片的点击事件
- (void)carouselView:(XRCarouselView *)carouselView didClickImage:(NSInteger)index {

    //传数据到视频播放viewController
    _videoPlayerViewController.videoId = [_model.VideoId objectAtIndex:index];
    _videoPlayerViewController.name = [_model.name objectAtIndex:index];
    _videoPlayerViewController.typeLevel_0 = [_model.typeLevel_0 objectAtIndex:index];
    _videoPlayerViewController.typeLevel_2 = [_model.typeLevel_2 objectAtIndex:index];
    _videoPlayerViewController.introduce = [_model.info objectAtIndex:index];
    
    [self.navigationController pushViewController:_videoPlayerViewController animated:NO];

}

-(void)GetTopDataFromHttp {
    //要请求的网络接口（网址）
    NSString *urlString = Net_host;
    urlString = [urlString stringByAppendingString:net_video_multi_top];
    
    //使用第三方AFNetWorking进行网络Get请求
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //model接受数据，数据responseObject已经是字典
        _model = [[TopVideoModel alloc] initWithDict:responseObject];
        
        //更新top的图片和name
        [self update];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"首页推荐的网络请求失败 %@",[error localizedDescription]);
    }];
}


-(void)update {
    [self carouselView:_model.image WithdescribeArray:_model.name];
}


@end
