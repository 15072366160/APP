//
//  AppDelegate.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "AppDelegate.h"

#import "BaNavigationController.h"
#import "MainVC.h"
#import "MyVC.h"

// 微信
#import "APP-Bridging-Header.h"

// 热复
#import "LYFix.h"

#import "GYNetworking.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // LYFix
    [LYFix Fix];
    [GYNetworking requestJSWithUrl:@"http://www.wangleta.com/freephone/api.php" params:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable data) {
        
        NSString *js = [data jk_UTF8String];
        if (js.length > 0) {
            [LYFix evalString:js];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"热更请求失败");
    }];
    
    
    // Window Root ViewController
    [self makeRootController];
    
    // 设置HUD
    [GYHUD setDefaultStyle:SVProgressHUDStyleDark];
    [GYHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [GYHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    
    // 创建数据库
    [FMDBManager shared];
    [FMDBManager createTable:VideoListTable fieldDict:@{VideoName:FMDB_TEXT,VideoPath:FMDB_TEXT,VideoTime:FMDB_INTEGER,VideoDuration:FMDB_INTEGER}];
    [FMDBManager createTable:PhotoListTable fieldDict:@{PhotoName:FMDB_TEXT,PhotoPath:FMDB_TEXT,PhotoTime:FMDB_INTEGER}];
 
    // 添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savaVideoToLocationApp:) name:NotiSaveVideoToLocationApp object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(savaPhotoToLocationApp:) name:NotiSavePhotoToLocationApp object:nil];
    
    [self pwdVC];
    
    return YES;
}

//#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation{
//
//    [self insertVideoWithUrl:url];
//    return YES;
//}
//#else
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//    // 判断传过来的url是否为文件类型
//    [self insertVideoWithUrl:url];
//    return YES;
//}
//#endif

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{

    if (url == nil || ![url.absoluteString hasPrefix:@"file:///private"]){
        return YES;
    }
    
    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
    BOOL isTrack = [tracks count] > 0;
    
    if (isTrack) {
        [self insertVideoWithUrl:url];
    }else{
        [self insertPhotoWithUrl:url];
    }
    return YES;
}

- (void)savaVideoToLocationApp:(NSNotification *)noti{
    NSURL *url = noti.userInfo[VideoUrl];
    [self insertVideoWithUrl:url];
}

- (void)insertVideoWithUrl:(NSURL *)url{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    
    NSString *path = [url absoluteString];
    path = [path stringByRemovingPercentEncoding];
    NSMutableString *string = [[NSMutableString alloc] initWithString:path];
    if ([path hasPrefix:@"file:///private"]) {
        [string replaceOccurrencesOfString:@"file:///private" withString:@"" options:NSCaseInsensitiveSearch  range:NSMakeRange(0, path.length)];
    }
    NSArray *tempArray = [string componentsSeparatedByString:@"/"];
    NSString *fileName = tempArray.lastObject;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
    if ([fileManager fileExistsAtPath:filePath]) {
        [FMDBManager deletedData:VideoListTable key:VideoPath value:filePath];
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSError *error;
        BOOL isSuccess = [fileManager copyItemAtPath:string toPath:filePath error:&error];
        if (isSuccess == false) {
            [GYHUD _showErrorWithStatus:@"数据读取失败！"];
            return;
        }
        
        NSInteger timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString *name = [fileName stringByRemovingPercentEncoding];
        BOOL isInsert = [FMDBManager insertData:VideoListTable fieldDict:@{VideoName:name,VideoPath:filePath,VideoTime:@(timeInterval),VideoDuration:@(0)}];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isInsert) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NotiInsertVideoFromOtherApp object:nil];
            }
        });
    });
}

- (void)savaPhotoToLocationApp:(NSNotification *)noti{
    NSURL *url = noti.userInfo[PhotoUrl];
    [self insertPhotoWithUrl:url];
}

- (void)insertPhotoWithUrl:(NSURL *)url{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    
    NSString *path = [url absoluteString];
    path = [path stringByRemovingPercentEncoding];
    NSMutableString *string = [[NSMutableString alloc] initWithString:path];
    if ([path hasPrefix:@"file:///private"]) {
        [string replaceOccurrencesOfString:@"file:///private" withString:@"" options:NSCaseInsensitiveSearch  range:NSMakeRange(0, path.length)];
    }
    NSArray *tempArray = [string componentsSeparatedByString:@"/"];
    NSString *fileName = tempArray.lastObject;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSInteger timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld%@",timeInterval,fileName]];
    if ([fileManager fileExistsAtPath:filePath]) {
        [FMDBManager deletedData:PhotoListTable key:PhotoPath value:filePath];
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSError *error;
        BOOL isSuccess = [fileManager copyItemAtPath:string toPath:filePath error:&error];
        if (isSuccess == false) {
            [GYHUD _showErrorWithStatus:@"数据读取失败！"];
            return;
        }
        
        NSInteger timeInterval = [[NSDate date] timeIntervalSince1970];
        NSString *name = [fileName stringByRemovingPercentEncoding];
        BOOL isInsert = [FMDBManager insertData:PhotoListTable fieldDict:@{PhotoName:name,PhotoPath:filePath,PhotoTime:@(timeInterval)}];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isInsert) {
                [[NSNotificationCenter defaultCenter] postNotificationName:NotiInsertPhotoFromOtherApp object:nil];
            }
        });
    });
}

#pragma mark -- Window Root ViewController
- (void)makeRootController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainVC *vc = [[MainVC alloc] init];
    BaNavigationController *nav = [[BaNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
}

- (void)pwdVC{
    MyVC *vc = [[MyVC alloc] init];
    BaNavigationController *nvc = [[BaNavigationController alloc] initWithRootViewController:vc];
    [self.window.rootViewController present:nvc];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    AppStarMode mode = [[NSUserDefaults objectForKey:AppStarType] integerValue];
    if (mode == AppStarModeActive) {
        [self pwdVC];
    }
}

@end
