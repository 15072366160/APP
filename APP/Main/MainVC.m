//
//  ViewController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MainVC.h"

#import "WechatAuthSDK.h"
#import "WXApi.h"
#import "WXApiObject.h"

@interface MainVC ()


@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    UIImage *image = [UIImage imageGradualVertical:HEX_COLOR(@"f12711") endColor:HEX_COLOR(@"f5af19") size:CGSizeMake(50, 200)];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
}

- (void)login{
    
    if ([WXApi isWXAppInstalled] == false) {
        [GYHUD _showErrorWithStatus:@"未安装微信，请先安装微信！"];
        return;
    }
    //构造SendAuthReq结构体
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123";
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

@end
