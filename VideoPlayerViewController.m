//
//  VideoPlayerViewController.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/6.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "VideoPlayerViewController.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"

@interface VideoPlayerViewController ()

@end

static UIButton * preButton = nil; //

@implementation VideoPlayerViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent]; //使前景部分为白色（时间、电池等位白色）
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHex:primary_color_0]; //背景颜色
    
    self.videoPlayerView = [[VideoPlayerView alloc] init];
    
    [self.view addSubview:self.videoPlayerView];
    
    [self.videoPlayerView.NameLabel setText:self.name];  //显示视频名
    
    [self.videoPlayerView.typeLabel setText:[NSString stringWithFormat:@"%@ | %@",self.typeLevel_0,self.typeLevel_2]]; //显示视频的类型
    
    [self.videoPlayerView.textView setText:self.introduce]; //显示视频简介
    
    [self GetDataVideoPlayer];//在将要出现控制器的方法里面请求网络
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //self.navigationController.navigationBar.hidden = NO;
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault]; //结束时使其颜色恢复
    
    [self.krVideoPlayerController stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



//播放
- (void)playVideo:(NSString *)urlString {
    //NSURL *url = [NSURL URLWithString:@"http://172.24.4.44/mrs/upload/video/mp4/1460726524168.mp4"];
    NSURL *url = [NSURL URLWithString:urlString];
    self.krVideoPlayerController.contentURL = url;
}

//对视频播放器的一系列初始化
- (void)addVideoPlayer{
    if (!self.krVideoPlayerController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.krVideoPlayerController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.krVideoPlayerController setDimissCompleteBlock:^{
            weakSelf.krVideoPlayerController = nil;
        }];
        [self.krVideoPlayerController setWillBackOrientationPortrait:^{ //小屏
            //weakSelf.navigationController.navigationBarHidden = YES;
            weakSelf.backButton.hidden = NO;
        
            if ([weakSelf respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
                
                [weakSelf prefersStatusBarHidden];  //使用此方法来设置顶部的状态栏隐藏属性
                
                [weakSelf performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];       //
                
            }
        }];
        [self.krVideoPlayerController setWillChangeToFullscreenMode:^{ //全屏
            weakSelf.backButton.hidden = YES;
            //[weakSelf toolbarHidden:YES];
            //weakSelf.navigationController.navigationBarHidden = YES;
            if ([weakSelf respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
                
                [weakSelf prefersStatusBarHidden]; //使用此方法来设置顶部的状态栏隐藏属性
                
                [weakSelf performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];       //
                
            }
        }];
        [self.videoPlayerView addSubview:self.krVideoPlayerController.view];
        [self.videoPlayerView addSubview:self.backButton];
    }
    
}

//获取网络数据
-(void)GetDataVideoPlayer {
    //拼接数据，为http://172.24.4.44/mrs/video/part/multi/id/?
    NSString *urlString = Net_host;
    urlString = [urlString stringByAppendingString:net_video_parts];
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"%@",_videoId]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _model = [[VideoPlayerModel alloc] initWithDict:responseObject];
        
        //更新UI
        [self GetDataPlayerAddrsFirst]; //在这里调用请求第一集的，因为model在上面的方法初始化了，不能再初始化，会导致要保存数据的消失
        [self updateButton];
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

//点击按钮后,请求获取播放地址,tag传button的tag
-(void)GetDataPlayerAddrs:(NSInteger)tag {

    //拼接数据,为http://172.24.4.44/mrs/video/file/http/id/fileId
    NSString *urlSting = Net_host;
    urlSting = [urlSting stringByAppendingString:net_video_parts_file];
    urlSting = [urlSting stringByAppendingString:[NSString stringWithFormat:@"%@",[_model.fileId objectAtIndex:[_model.fileId count] - tag - 1]]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:urlSting parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *videoAddr = [responseObject valueForKeyPath:@"object.path"]; //获取播放地址
        [self updateVideoPlayerAddr:videoAddr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取播放地址失败，原因:%@",[error localizedDescription]);
    }];
}

//更新播放地址操作
-(void)updateVideoPlayerAddr:(NSString *)videoAddr {
    [self.krVideoPlayerController pause];
    [self update:videoAddr];
}

//请求第一个播放地址,默认播放第一集
-(void)GetDataPlayerAddrsFirst {
    //拼接数据,为http://172.24.4.44/mrs/video/file/http/id/fileId
    NSString *urlSting = Net_host;
    urlSting = [urlSting stringByAppendingString:net_video_parts_file];
    urlSting = [urlSting stringByAppendingString:[NSString stringWithFormat:@"%@",[_model.fileId objectAtIndex:[_model.fileId count]-1]]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:urlSting parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *videoAddr = [responseObject valueForKeyPath:@"object.path"]; //获取播放地址
        [self update:videoAddr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取播放地址失败，原因:%@",[error localizedDescription]);
    }];
}
//传递播放地址
-(void)update:(NSString *)videoAddr {
    [self playVideo:videoAddr];
}

//显示button
-(void)updateButton {
    [self setEpisodeButton:[_model.episodeId intValue] WithRowOfButtonNumber:6];
    [self addVideoPlayer];  //显示播放器
}





//显示按钮
-(void)setEpisodeButton:(int)EpisodeId WithRowOfButtonNumber:(int)number {
    //按钮的间隙
    double padding = ScreenWidth/50;
    //按钮为矩形，按钮的边长，width减去间隙再除去number.
    double width = (ScreenWidth - (number+1) * padding)/number;
    
    //行数
    int row = 0;
    
    for (int i = 0; i < EpisodeId; i++) {
        UIButton * button;
        
        
        if (i != 0 && i % number == 0) {
            row++;
        }
        
        //按钮分布
        button = [[UIButton alloc] initWithFrame:CGRectMake((padding * (i % number + 1) )+ (width * (i%number)) , padding +(padding +width) * row, width, width)];
        button.tag = i;  //绑定标志,初始化后绑定才有效
        //按钮的设置
        if (button.tag == 0) {  //因为默认播放第一集，所以初始化的时候按钮就是被点击状态，并且把第一个按钮保存下来，下次点击其他按钮时，第一个按钮就会变成白色了。
            [button setBackgroundColor:[UIColor clearColor]];
            preButton = button;
        }
        else {
            [button setBackgroundColor:[UIColor whiteColor]];//点击时要改变
        }
        [button setTitleColor:[UIColor colorWithHex:main_text_title_color_light] forState:UIControlStateNormal];//点击时要改变？
        [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //视图添加按钮控件,添加到滚动视图上
        [self.videoPlayerView.buttonView addSubview:button];
    }
}


//视频按钮的响应事件
-(void)buttonAction:(UIButton *)button {
    //NSLog(@"点击了第%ld个按钮",(long)button.tag + 1);
    
    if (preButton != nil && preButton != button) {
        preButton.backgroundColor = [UIColor whiteColor];
        [self buttonGetDateFromHttp:button.tag];
    }
    
    if (preButton == button) {
        NSLog(@"已经是第%ld集了",(button.tag + 1));
    }
    
    button.backgroundColor = [UIColor clearColor];
    
    preButton = button;
}



//点击按钮请求数据,传tag确定请求哪个
-(void)buttonGetDateFromHttp :(NSInteger) tag{
    [self GetDataPlayerAddrs:tag];
}


-(UIButton *)backButton {
    if (!_backButton) {
        UIImage* image=[UIImage imageNamed:@"icon_back.png"];
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame =CGRectMake(5, 20, 16, 16);
        [_backButton setBackgroundImage:image forState:UIControlStateNormal];
        [_backButton addTarget: self action: @selector(BackButtonAction:) forControlEvents: UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

//视频播放器返回按钮响应
-(void)BackButtonAction :(UIButton *)button{
    
    self.navigationController.navigationBar.hidden = YES; //点击返回时要使其不隐藏，否则会到首页导航就隐藏了
    
    [self.navigationController popViewControllerAnimated:NO];
}


@end
