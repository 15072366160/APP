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
    UIView *_gradualView;
}

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _gradualView = [[UIView alloc] init];
    [self.view addSubview:_gradualView];
    [_gradualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(300);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    
    self.navigationController.navigationBar.translucent = true;
    [self.navigationController.navigationBar gradualVertical:HEX_COLOR(@"FF416C") endColor:HEX_COLOR(@"FF4B2B")];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
    [_gradualView gradualVertical:HEX_COLOR(@"FF416C") endColor:HEX_COLOR(@"FF4B2B")];
}

@end
