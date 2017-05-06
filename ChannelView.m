//
//  ChannelView.m
//  42Video-rewrite
//
//  Created by dragon on 16/5/10.
//  Copyright © 2016年 李荣繁(LiDragon). All rights reserved.
//

#import "ChannelView.h"
#import "UIColor+Hex.h"
#include "AppConstant.h"


@implementation ChannelView

-(instancetype)init {
    if (self = [super init]) {
        
        _model = [[ChannelModel alloc] init]; //因为要调用类方法，所以需要初始化
        
        self.frame = [UIScreen mainScreen].bounds;   //屏幕大小不设置就为0！！！
        self.backgroundColor = [UIColor colorWithHex:primary_color_0]; //背景颜色
        [self addSubview:self.horizontaView];
        [self addSubview:self.navigationBar];
        [_navigationBar addSubview:self.titleLabel];
        [_navigationBar addSubview:self.latestButton];
        [_navigationBar addSubview:self.hotButton];
        [_navigationBar addSubview:self.sorceButton];
        [_navigationBar addSubview:self.SelectionButton];
        
        //请求数据
        [self getLastestDataFromHttp];
        
        [_horizontaView addSubview:[self collectionView:0]];
        
        [self addSubview:self.rightView];

        
//        [_horizontaView addSubview:[self collectionView:ScreenWidth]];
//        [_horizontaView addSubview:[self collectionView:ScreenWidth*2]];
        
        
    }
    
    return self;
}





-(UINavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/6)];
    }
    
    return _navigationBar;
}

-(UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth, ScreenHeight/6, ScreenWidth/3, ScreenHeight)];
        
        _rightView.backgroundColor = [UIColor redColor];
    }
    
    return _rightView;
}

-(UIScrollView *)horizontaView {
    if (!_horizontaView) {
        _horizontaView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, ScreenHeight/6, ScreenWidth, ScreenHeight - ScreenHeight/6)];
        _horizontaView.backgroundColor = [UIColor colorWithHex:primary_color_0];
        
        _horizontaView.pagingEnabled = YES;  //开启分页
        _horizontaView.scrollEnabled = YES;
        _horizontaView.canCancelContentTouches = NO;
        _horizontaView.showsHorizontalScrollIndicator = NO;  //水平滚动条
        _horizontaView.bounces = NO;
        _horizontaView.directionalLockEnabled = YES; //设置每次只能朝一个方向滚动
        
        [_horizontaView setContentSize:CGSizeMake(ScreenWidth * 3, 0)];
        
    }
    
    return _horizontaView;
}



-(UICollectionView *)collectionView:(CGFloat)width {
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    [flowLaout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLaout.minimumInteritemSpacing = 0.0;
    
    _collectionView= [[UICollectionView alloc] initWithFrame:CGRectMake(width, 0, ScreenWidth, ScreenHeight - ScreenHeight/6 - ScreenHeight / 12) collectionViewLayout:flowLaout];
    
    _collectionView.bounces = NO;
    _collectionView.delegate =self;
    _collectionView.dataSource = self;
    
    [_collectionView setBackgroundColor:[UIColor colorWithHex:primary_color_0]];
    
    
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    return _collectionView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2 - ScreenWidth/10, ScreenWidth/30, ScreenWidth/5, ScreenHeight/10)];
        _titleLabel.textColor = [UIColor colorWithHex:primary_color_500_mask];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"频  道";
    }
    
    return _titleLabel;
}


-(UIButton *)latestButton {
    if (!_latestButton) {
        _latestButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/200, _navigationBar.frame.size.height*(7.0/10), ScreenWidth/9, ScreenWidth/11)];
        _latestButton.backgroundColor = [UIColor clearColor];
        [_latestButton setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
        [_latestButton setTitle:@"最新" forState:UIControlStateNormal];
        _latestButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_latestButton addTarget:self action:@selector(latestAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _latestButton;
}

-(UIButton *)hotButton {
    if (!_hotButton) {
        _hotButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/200 * 2 +  ScreenWidth/9, _navigationBar.frame.size.height*(7.0/10), ScreenWidth/9, ScreenWidth/11)];
        _hotButton.backgroundColor = [UIColor clearColor];
        [_hotButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [_hotButton setTitle:@"最热" forState:UIControlStateNormal];
        _hotButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_hotButton addTarget:self action:@selector(HotAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _hotButton;
}

-(UIButton *)sorceButton {
    if (!_sorceButton) {
        _sorceButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/200 * 3 +  ScreenWidth/9 * 2, _navigationBar.frame.size.height*(7.0/10), ScreenWidth/9, ScreenWidth/11)];
        _sorceButton.backgroundColor = [UIColor clearColor];
        [_sorceButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [_sorceButton setTitle:@"评分" forState:UIControlStateNormal];
        _sorceButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_sorceButton addTarget:self action:@selector(sorceAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _sorceButton;
}

-(UIButton *)SelectionButton {
    if (!_SelectionButton) {
        _SelectionButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - ScreenWidth/9 - ScreenWidth/100, _navigationBar.frame.size.height*(7.0/10), ScreenWidth/9, ScreenWidth/11)];
        _SelectionButton.backgroundColor = [UIColor clearColor];
        [_SelectionButton setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        [_SelectionButton setTitle:@"筛选" forState:UIControlStateNormal];
        _SelectionButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_SelectionButton addTarget:self action:@selector(selectionAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _SelectionButton;
}


-(void)latestAction:(UIButton *)button {
    [_collectionView reloadData];
    
    if (self.latestButtonAction) {
        self.latestButtonAction();
    }
    else {
        NSLog(@"回调失败");
    }
}

-(void)HotAction:(UIButton *)button {
    
    if (self.hotButtonAction) {
        self.hotButtonAction();
    }
    else {
        NSLog(@"回调失败");
    }
}


-(void)sorceAction:(UIButton *)button {
    
    
    if (self.sorceButtonAction) {
        self.sorceButtonAction();
    }
    else {
        NSLog(@"回调失败");
    }
}

-(void)selectionAction:(UIButton *)button {
    static int index = 0;   //点击状态
    if (index == 0) {
        index = 1;
        [button setTitleColor:[UIColor colorWithHex:primary_color_500_mask] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.rightView.frame = CGRectMake(ScreenWidth - ScreenWidth/3, ScreenHeight/6, ScreenWidth/3, ScreenHeight);
        }];

    }
    else {
        index = 0;
        [button setTitleColor:[UIColor colorWithHex:main_text_title_color] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.rightView.frame = CGRectMake(ScreenWidth, ScreenHeight/6, ScreenWidth/3, ScreenHeight);
        }];
    }
}


#pragma mark -CollectionView
//cell内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cellidentifier = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cellidentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithHex:primary_color_500_mask];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, (ScreenWidth/2 - ScreenWidth/200) * (9.0/16.0), ScreenWidth/2 - ScreenWidth/100, cell.frame.size.height - (ScreenWidth/2 - ScreenWidth/200) * (9.0/16.0))];
    
    label.backgroundColor = [UIColor colorWithHex:primary_color_0];
    
    label.font = [UIFont systemFontOfSize:13];
    
    label.text = [_model.name objectAtIndex:indexPath.row];
    
    
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2 - ScreenWidth/100, (ScreenWidth/2 - ScreenWidth/200) * (9.0/16.0))];

    
    
    [view sd_setImageWithURL:[NSURL URLWithString:[_model.image objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    [cell.contentView addSubview:view];
    
    
    [cell.contentView addSubview:label];
    
    return cell;
}





//每个部分几个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 16;
}

//有几个部分section
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth/2 - ScreenWidth/100, (ScreenWidth/3 + ScreenWidth/30));
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(ScreenWidth/60, ScreenWidth/120, ScreenWidth/60, ScreenWidth/120);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"第%ld个cell被点击",(long)indexPath.row);
    
    self.cellDidSelectAction(indexPath.row);
    
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)getLastestDataFromHttp {
    //请求地址字符串类似于:http://172.24.4.44/mrs/video/multi/type/?/content/?/region/?/latest/?/hot/?/score/?/page_index/?/page_size/?
    NSString *urlString = [_model net_video_multis_StringWithType:0 Content:0 Region:0 Lastest:1 Hot:0 Score:0 Page_index:0 Page_size:16];
    
    //使用第三方AFNetWorking进行网络Get请求
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSLog(@"%@",responseObject);
        
        [_model initWithDict:responseObject];
        
        //在数据请求完后进行cell的刷新，因为优先UI再数据请求，然后在线程里刷新UI
        [_collectionView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}


@end
