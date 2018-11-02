//
//  SYHCommon.m
//  SYHGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "GYCommon.h"

@implementation GYCommon

+ (UIViewController *)currentViewController{
    UIViewController *rootvc = [[UIApplication sharedApplication] delegate].window.rootViewController;
    UIViewController *vc = [GYCommon vcWithRootVC:rootvc];
    GYLog(@"CurrentViewController: %@",NSStringFromClass(vc.class));
    return vc;
}

+ (UIViewController *)vcWithRootVC:(UIViewController *)vc{
    UIViewController *currentVC = nil;
    UIViewController *rootVC = vc.presentedViewController;
    if (rootVC == nil) {
        return vc;
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tvc = (UITabBarController *)rootVC;
        currentVC = [GYCommon vcWithRootVC:tvc.selectedViewController];
    }else if ([rootVC isKindOfClass:[UINavigationController class]]){
        
        UINavigationController *nvc = (UINavigationController *)rootVC;
        currentVC = [GYCommon vcWithRootVC:nvc.visibleViewController];
    }else{
        
        currentVC = [GYCommon vcWithRootVC:rootVC];
    }
    
    return currentVC;
}

+(NSString *)pregReplaceEmojiWithString:(NSString *)string
{
    NSString *pattern = @"[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]";
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    return [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""];
}


@end
