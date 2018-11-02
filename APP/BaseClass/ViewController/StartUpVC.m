//
//  StartUpVC.m
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#import "StartUpVC.h"

#import "SDCycleScrollView.h"

@interface StartUpVC ()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) UIButton *beginBtn;// 即将开始

@property (nonatomic,strong) SDCycleScrollView *advView;// 广告栏

@property (nonatomic,copy)   NSArray *imgs;

@end

@implementation StartUpVC

- (NSArray *)imgs{
    if (!_imgs) {
        NSString *iphone = nil;
        if (IS_IPHONE_5S_5SE) {
            iphone = @"SE";
        }else if (IS_IPHONE_6_6S_7_8){
            iphone = @"S";
        }else if (IS_IPHONE_6P_6SP_7P_8P){
            iphone = @"P";
        }else if (IS_IPHONE_X_Xs){
            iphone = @"X";
        }else if (IS_IPHONE_Xr_XsMax){
            iphone = @"X";
        }else{
            iphone = @"P";
        }
        NSMutableArray *imgs = [NSMutableArray array];
        for (int i=0; i<3; i++) {
            NSString *img = [NSString stringWithFormat:@"引导页_%@_%d",iphone,i+1];
            [imgs addObject:img];
        }
        _imgs = imgs;
    }
    return _imgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BLACK_COLOR;
    
    // 添加滑动照片
    self.advView = [SDCycleScrollView cycleScrollViewWithFrame:self.view.bounds delegate:self placeholderImage:nil];
    self.advView.autoScroll = false;
    self.advView.infiniteLoop = false;
    self.advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    self.advView.pageControlBottomOffset = 55.0 + [GYScreen shared].tabBarAddH;
    self.advView.pageDotColor = BACKGROUND_COLOR;
    self.advView.backgroundColor = BACKGROUND_COLOR;
    //StartUpVC修改照片
    self.advView.localizationImageNamesGroup = self.imgs;
    [self.view addSubview:self.advView];
    
    // 添加btn
    self.beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.beginBtn];
    
    [self.beginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140.0, 45.0));
        make.bottom.mas_equalTo(-80.0 + [GYScreen shared].tabBarAddH);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    // StartUpVC立即进入
    self.beginBtn.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [self.beginBtn setTitle:@"立即进入" forState:0];
    [self.beginBtn addTarget:self action:@selector(replaceRootVC) forControlEvents:UIControlEventTouchUpInside];
    self.beginBtn.titleLabel.font = FONT_BOLD(18.0);
    [self.beginBtn setTitleColor:MAIN_COLOR forState:0];
    
    self.beginBtn.alpha = 0;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.beginBtn cor];
}

- (void)replaceRootVC{
    if (!self.rootVC) {
        [GYHUD _showErrorWithStatus:@"root_vc = nil"];
        return;
    }

    [UIView transitionWithView:self.view.window duration:0.7 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        self.view.window.rootViewController = self.rootVC;
    } completion:nil];
}

#pragma mark -- SDCycleScrollViewDelegate
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    if (index == self.imgs.count - 1) {
        [UIView animateWithDuration:0.3 animations:^{
            self.beginBtn.alpha = 1;
            self.advView.showPageControl = false;
        }];
    }else if (index == self.imgs.count - 2) {
        [UIView animateWithDuration:0.1 animations:^{
            self.beginBtn.alpha = 0;
            self.advView.showPageControl = true;
        }];
    }
}

- (void)dealloc{
    GYLog_delloc(self);
}

@end
