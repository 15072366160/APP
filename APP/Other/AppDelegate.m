//
//  AppDelegate.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "AppDelegate.h"
#import "BaTabBarController.h"

// 微信
#import "WXApi.h"
#import "APP-Bridging-Header.h"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Window Root ViewController
    [self makeRootController];
    
    // 设置HUD
    [GYHUD setDefaultStyle:SVProgressHUDStyleDark];
    [GYHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [GYHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    // 微信注册
    [WXApi registerApp:AppID];
    
    return YES;
}

#pragma mark -- Window Root ViewController
- (void)makeRootController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    BaTabBarController *tab = [[BaTabBarController alloc] init];
    self.window.rootViewController = tab;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    if ([url.scheme isEqualToString:AppID]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    return true;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    if ([url.scheme isEqualToString:AppID]) {
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    return true;
}

-(void) onReq:(BaseReq*)req{
    
}

-(void) onResp:(BaseResp*)resp{
     if ([resp isKindOfClass:[SendAuthResp class]]) {
         
         SendAuthResp *temp = (SendAuthResp *)resp;
         NSMutableDictionary *dict = [NSMutableDictionary dictionary];
             [dict addValue:AppID key:@"appid"];
             [dict addValue:AppSecret key:@"secret"];
             [dict addValue:temp.code key:@"code"];
             [dict addValue:@"authorization_code" key:@"grant_type"];
         [GYNetworking requestMode:NetModeGET header:nil url:@"https://api.weixin.qq.com/sns/oauth2/access_token" params:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
             
             GYLog(@"请求access的data = %@", data);
             NSDictionary *dict = (NSDictionary *)data;
             [NSUserDefaults addValue:dict[WX_ACCESS_TOKEN] key:WX_ACCESS_TOKEN];
             [NSUserDefaults addValue:dict[WX_OPEN_ID] key:WX_OPEN_ID];
             [NSUserDefaults addValue:dict[WX_REFRESH_TOKEN] key:WX_REFRESH_TOKEN];

             [GYNOTI postNotificationName:NOTI_WX_LOGIN object:nil];
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             [GYHUD _showErrorWithStatus:@"网络未连接，请检查网络！"];
         }];
     }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
