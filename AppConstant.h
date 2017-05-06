//
//  AppConstant.h
//  42Certer-Three
//
//  Created by dragon on 15/11/30.
//  Copyright © 2015年 dragon. All rights reserved.
//  一些常量的定义

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "ScreenUtils.h"
#ifndef AppConstant_h
#define AppConstant_h


#pragma mark  屏幕尺寸
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height


#pragma mark - 颜色配置    需要使用扩展的color方法将16进制转化成rgb a格式
#define primary_color_0 0xF7F7F7
#define primary_color_50 0xF1EFF0
#define primary_color_50_mask 0xF1EFF0  //alpha 0.6
#define primary_color_100 0xF3C1C3
#define primary_color_200 0xF0ABAE
#define primary_color_300 0xED9498
#define primary_color_400 0xED797E
#define primary_color_500 0xEB5E64
#define primary_color_500_mask 0xEB5E64  //alpha 0.95
#define primary_color_600 0xEB4A51
#define primary_color_700 0xDB3A41
#define primary_color_800 0xC3292F
#define primary_color_900 0xAA1D22

#define primary_color_grey_50 0xFAFAFA
#define primary_color_grey_100 0xF5F5F5
#define primary_color_grey_200 0xEEEEEE
#define primary_color_grey_300 0xE0E0E0
#define primary_color_grey_400 0xBDBDBD
#define primary_color_grey_500 0x9E9E9E
#define primary_color_grey_600 0x757575
#define primary_color_grey_700 0x616161
#define primary_color_grey_800 0x424242
#define primary_color_grey_900 0x212121
#define primary_color_grey_1000 0x000000

#define primary_color_orange_100 0xFFD5B5
#define primary_color_orange_300 0xFFBD8A
#define primary_color_orange_500 0xEF9E60
#define primary_color_orange_700 0xD37C3A
#define primary_color_orange_900 0xAD5B1C

#define main_text_title_color_dark 0x000000
#define main_text_title_color_light 0x8F8C8C
#define main_text_title_color_lighter 0xBDBDBD
#define main_text_title_color 0x585151

#define layout_main_tab_background 0xECEAEB
#define layout_channel_content_drawer_background 0xE3DDDD  //alpha 0.6

#define app_msg_background 0xFFFFCC

#define main_mask_lighter 0x000000  //alpha 0.0
#define main_mask_light 0x000000 //alpha 0.26
#define main_mask 0x000000 //alpha 0.6





#pragma mark 登录界面
#define deLoginTextInfo @"请输入账号"
#define dePwdInTextInfo @"请输入密码"
#define deLoginLabelInfo @"账号"
#define dePwdLabelInfo @"密码"
#define deRemberPwdLabel @"记住密码"
#define deloginButtonTitle @"登录"
#define deLoginOutButtonTitle @"注销"


#pragma mark 警告框
#define AlertTitle @"提示"
#define AlertMeassge @"注销成功"
#define AlertActionTitleOK @"好"


#pragma mark 网络连接的相关数据 
#define PID @"1"
#define CALG @"12345678"
#define LOGINURL @"http://172.24.254.138"
#define LOGIOUTURL @"http://172.24.254.138/F.html"
//保存到arrayKeys
#define KEY1 @"DDDDD"
#define KEY2 @"upass"
#define KEY3 @"R1"
#define KEY4 @"R2"
#define KEY5 @"para"
#define KEY6 @"0MKKEY"
//保存到arrayValues
#define VALUE3 @"0"
#define VALUE4 @"1"
#define VALUE5 @"00"
#define VALUE6 @"123456"


#pragma mark 图片的常量名定义
#define LoadingViewPicture @"anim_loading.gif"  //加载数据，用户等待时显示的活动指示器's picture
//**--  首页10个按钮的图片  --**//
#define latestPicture @"icon_column_latest.png"
#define varietyPicture @"icon_column_variety.png"
#define moviePicture @"icon_column_movie.png"
#define teleplayPicture @"icon_column_teleplay.png"
#define carttoonPicture @"icon_column_carttoon.png"
#define comedyPicture @"icon_column_comedy.png"
#define schoolPicture @"icon_column_school.png"
#define musicPicture @"1_0000s_0007_音乐.png"
#define gymPicture @"1_0000s_0008_体育.png"
#define morePicture @"icon_column_more.png"

#pragma mark storyBoardID
#define PageViewControllerID @"pageviewcontroller"  //      欢迎页
#define ImageViewControllerID @"ImageViewController"    //
#define TabBarControllerID @"tabBarController"    //下面的导航
#define SearchContentViewControllerID @"SearchContentViewController"  //频道页
#define VideoPlayViewControllerID @"VideoPlayViewController"  // 视频播放页

#pragma mark 引导页按钮的文字
#define ButtonTitle @"进入体验"

#pragma mark 引导页的页数
#define TeachPageNumber 2 //从0开始

#pragma mark 广告页的页数
#define PageNumber 3

#pragma mark 按钮的自定义内容
#define ButtonTitle1 @"最新"
#define ButtonTitle2 @"综艺"
#define ButtonTitle3 @"电影"
#define ButtonTitle4 @"剧场"
#define ButtonTitle5 @"动漫"
#define ButtonTitle6 @"娱乐"
#define ButtonTitle7 @"校内"
#define ButtonTitle8 @"音乐"
#define ButtonTitle9 @"体育"
#define ButtonTitle10 @"更多"

#pragma mark 按钮的自定义内容 cellPageNumber  cellview的高度是一个屏幕的高度
#define cellPageNumber 7


#pragma mark -接口  net_host + ***
#define Net_host  @"http://172.24.4.44/mrs"
//分级
#define net_video_level_0 @"/video/level/0"
#define net_video_level_1 @"/video/level/1"
#define net_video_level_2 @"/video/level/2"
//置顶视频
#define net_video_multi_top @"/video/multi/top/6/list"
//排序
//#define net_video_multis   ///video/multi/type/?/content/?/region/?/latest/?/hot/?/score/?/page_index/?/page_size/?
#define net_video_multis_type @"/video/multi/type/"
#define net_video_multis_content @"/content/"
#define net_video_multis_region @"/region/"
#define net_video_multis_latest @"/latest/"
#define net_video_multis_hot @"/hot/"
#define net_video_multis_score @"/score/"
#define net_video_multis_page_index @"/page_index/"
#define net_video_multis_page_size @"/page_size/"

//根据视频的ID拿到剧集列表
#define net_video_parts @"/video/part/multi/id/" //+ 具体的id
//根据剧集里面的文件ID拿播放地址
#define net_video_parts_file @"/video/file/http/id/"


//搜索关键字
//#define net_video_search @"/video/multi/search/?/page_index/0/page_size/10"

//欢迎页
#define net_helloworld_list @"/helloworld/list"
//软件信息
#define net_html_team_info @"/html/team_info.html"
#define net_html_software @"/html/software.html"
#define net_html_nav @"/html/nav.html"


//tabBarController下方的item的文字内容设置
#define FirstItemName @"首页"
#define SecondItemName @"频道"
#define ThirdItemName @"网络"

#endif /* AppConstant_h */








