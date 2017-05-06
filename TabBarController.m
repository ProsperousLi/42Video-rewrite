//
//  TabBarController.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/4.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "TabBarController.h"
#import "NetworkConnectViewController.h"
#import "HomePageViewController.h"
#import "ChannelViewController.h"
#import "AppConstant.h"
#import "UIColor+Hex.h"

@interface TabBarController ()

@end

@implementation TabBarController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;  //push过后再返回的不会使scrollview偏移了
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.tabBar removeFromSuperview]; //移除原来的tabBar
    self.delegate = self;   //设置代理
    
    self.navigationItem.title = @"42媒体中心";  //加载页面首页的导航标题初始化，下方的代理的didSelectViewController方法需要改变点击才能执行。
    
    //添加导航右侧的item（先定义一个item，然后再赋值，这样才算有效）,自定义一个button
    UIImage* image=[UIImage imageNamed:@"NormalMore.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(0, 0, 32, 32);
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget: self action: @selector(MoreButtonAction:) forControlEvents: UIControlEventTouchUpInside];
    
    //item的initWithCustomView方法添加自定义按钮
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    
    self.tabBar.tintColor = [UIColor colorWithHex:primary_color_500_mask]; //tabBarItem被选中的颜色
    
    //[self.view addSubview:self.navagationBar];
    
    [self addOtherControllerToTabBarController]; //添加别的视图控制器到本视图控制器
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



//导航右侧按钮的响应事件

-(void)MoreButtonAction:(id)serder {
    NSLog(@"更多");
}

//添加别的视图控制器到本视图控制器

-(void)addOtherControllerToTabBarController {
    
    //声明数组,将视图控制器保存于一个数组里
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    //初始化首页视图控制器,并设置tabBarItem，并添加到tabBarViewController里面
    HomePageViewController *homePageViewController;
    homePageViewController = [[HomePageViewController alloc] init];
    homePageViewController.tabBarItem.title = FirstItemName;  //不直接调用title是因为要使用导航的标题，会冲突
    homePageViewController.tabBarItem.image = [UIImage imageNamed:@"home_select.png"];
    [array addObject:homePageViewController];
    
    //初始化频道视图控制器,并设置tabBarItem，并添加到tabBarViewController里面
    ChannelViewController * channelViewController;
    channelViewController = [[ChannelViewController alloc] init];
    channelViewController.tabBarItem.title = SecondItemName;
    channelViewController.tabBarItem.image = [UIImage imageNamed:@"bnt_channel_selected.png"];
    [array addObject:channelViewController];
    
    //初始化网络控制器，并使其标题为FirstItemName,并添加到tabBarViewController里面
    NetworkConnectViewController *networkConnectViewController;
    networkConnectViewController = [[NetworkConnectViewController alloc] init];
    networkConnectViewController.tabBarItem.title = ThirdItemName;
    networkConnectViewController.tabBarItem.image = [UIImage imageNamed:@"bnt_net_selected.png"];
    [array addObject:networkConnectViewController];

    //将控制器加入到tabBarController中
    self.viewControllers = array;
    
}


//代理方法，当点击时会调用,即使点击的是当前按钮，还是会调用。

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    int selectedIndex = (int)tabBarController.selectedIndex; //哪个按钮被点击了，返回索引，从0开始

    switch (selectedIndex) {
        case 0:
            viewController.tabBarController.navigationController.navigationBar.hidden = NO;
            viewController.tabBarController.navigationItem.title = @"42媒体中心";
            viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            break;
        case 1:
            viewController.tabBarController.navigationController.navigationBar.hidden = YES;
//            viewController.tabBarController.navigationItem.title = @"频道";
//                        viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/8);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            break;
        case 2:
            viewController.tabBarController.navigationController.navigationBar.hidden = NO;
            viewController.tabBarController.navigationItem.title = @"网络中心";
            viewController.tabBarController.navigationController.navigationBar.frame = CGRectMake(0, 0, ScreenWidth, 64);//iOS7对UINavigationBar的标准进行重新的定义,其高度可以延伸到状态栏.所以44+20的高度等于64.
            break;
        default:
            break;
    }
}



@end
