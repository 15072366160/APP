//
//  ViewController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

{
    UIImageView *_gradualView;
}

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _gradualView = [[UIImageView alloc] init];
//    _gradualView.image = [UIImage imageGradual:CGPointMake(0, 0) endPoint:CGPointMake(1, 1) startColor:HEX_COLOR(@"fd1d1d") endColor:HEX_COLOR(@"fcb045") size:CGSizeMake(300, 300)];
//    [self.view addSubview:_gradualView];
//    [_gradualView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(300);
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.centerY.mas_equalTo(self.view.mas_centerY);
//    }];
    
//    self.navigationController.navigationBar.translucent = true;
//    [self.navigationController.navigationBar gradualVertical:HEX_COLOR(@"FF416C") endColor:HEX_COLOR(@"FF4B2B")];
    
    
    UIImage *image = [UIImage imageGradual:CGPointMake(0, 0) endPoint:CGPointMake(1, 1) startColor:HEX_COLOR(@"fd1d1d") endColor:HEX_COLOR(@"fcb045") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage jk_imageWithColor:CLEAR_COLOR];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//
//
//    [_gradualView gradualVertical:HEX_COLOR(@"fd1d1d") endColor:HEX_COLOR(@"fcb045")];
//}

@end
