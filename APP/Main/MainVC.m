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

#import "GYTableViewController.h"

@interface MainVC ()


@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BK"]];
    
    UIImage *img = [UIImage imageGradualOblique:HEX_COLOR(@"ff9966") endColor:HEX_COLOR(@"ff5e62") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    UIImage *image = [UIImage imageGradualOblique:HEX_COLOR(@"ff9966") endColor:HEX_COLOR(@"ff5e62") size:CGSizeMake(50, 200)];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];

    [GYNOTI addObserver:self selector:@selector(checkLogin) name:NOTI_WX_LOGIN object:nil];
}

- (void)test{
    
    GYTableViewController *vc = [[GYTableViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.hidesBottomBarWhenPushed = true;
    [self push:vc];
}

- (void)dealloc{
    [GYNOTI removeObserver:self name:NOTI_WX_LOGIN object:nil];
}

- (void)checkLogin{
    NSString *accessToken = [NSUserDefaults objectForKey:WX_ACCESS_TOKEN];
    NSString *openID = [NSUserDefaults objectForKey:WX_OPEN_ID];
    
    if (accessToken.length > 0 && openID.length > 0) {
        NSString *refreshToken = [NSUserDefaults objectForKey:WX_REFRESH_TOKEN];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict addValue:AppID key:@"appid"];
        [dict addValue:@"refresh_token" key:@"grant_type"];
        [dict addValue:refreshToken key:@"refresh_token"];
        [GYNetworking requestMode:NetModeGET header:nil url:@"https://api.weixin.qq.com/sns/oauth2/refresh_token" params:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
    
            NSDictionary *dict = (NSDictionary *)data;
            NSString *reAccessToken = dict[WX_ACCESS_TOKEN];
            // 如果reAccessToken为空,说明reAccessToken也过期了,反之则没有过期
            if (reAccessToken) {
                // 更新access_token、refresh_token、open_id
                [NSUserDefaults addValue:dict[WX_ACCESS_TOKEN] key:WX_ACCESS_TOKEN];
                [NSUserDefaults addValue:dict[WX_OPEN_ID] key:WX_OPEN_ID];
                [NSUserDefaults addValue:dict[WX_REFRESH_TOKEN] key:WX_REFRESH_TOKEN];
                
                [self getWXUserInfo];
            }else {
                [self login];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [GYHUD _showErrorWithStatus:@"网络未连接，请检查网络！"];
        }];
    }else{
        [self login];
    }
}

- (void)login{
    
    if ([WXApi isWXAppInstalled] == false) {
        [UIAlertController alert:@"该设备未安装微信，是否前往App Store安装微信？" sure:^(UIAlertAction *action) {
            NSURL *url = [NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/%E5%BE%AE%E4%BF%A1/id414478124?mt=8"];
            [[UIApplication sharedApplication] openURL:url];
        } canle:nil];
        return;
    }
    //构造SendAuthReq结构体
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123";
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

// 获取用户个人信息（UnionID机制）
- (void)getWXUserInfo {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addValue:[NSUserDefaults objectForKey:WX_ACCESS_TOKEN] key:WX_ACCESS_TOKEN];
    [dict addValue:[NSUserDefaults objectForKey:WX_OPEN_ID] key:WX_OPEN_ID];
    [GYNetworking requestMode:NetModeGET header:nil url:@"https://api.weixin.qq.com/sns/userinfo" params:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        
        GYLog(@"info:%@",data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [GYHUD _showErrorWithStatus:@"网络未连接，请检查网络！"];
    }];
}

@end
