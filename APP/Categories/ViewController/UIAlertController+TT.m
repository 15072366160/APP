//
//  UIAlertController+TT.m
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/5/15.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UIAlertController+TT.h"

@implementation UIAlertController (TT)

+ (void)alert:(NSString *)message sureText:(NSString *)sureText cancleText:(NSString *)cancleText sure:(void(^)(UIAlertAction *action))sure canle:(void(^)(UIAlertAction *action))canle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:sureText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sure) {
            sure(action);
        }
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:cancleText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (canle) {
            canle(action);
        }
    }];
    [alert addAction:action2];
    [alert addAction:action1];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController *vc = window.rootViewController;
    [vc present:alert];
}

+ (void)alert:(NSString *)message sure:(void(^)(UIAlertAction *action))sure canle:(void(^)(UIAlertAction *action))canle{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sure) {
            sure(action);
        }
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (canle) {
            canle(action);
        }
    }];
    [alert addAction:action2];
    [alert addAction:action1];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController *vc = window.rootViewController;
    [vc present:alert];
}

+ (void)alert:(NSString *)message sure:(void(^)(UIAlertAction *action))sure{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleActionSheet];
    //修改title
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:message];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, message.length)];
    [att addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, message.length)];
    [alert setValue:att forKey:@"attributedMessage"];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (sure) {
            sure(action);
        }
    }];
    [alert addAction:action1];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIViewController *vc = window.rootViewController;
    [vc present:alert];
}


@end
