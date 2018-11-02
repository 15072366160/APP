//
//  UIAlertController+TT.h
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/5/15.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (TT)

+ (void)alert:(NSString *)message sureText:(NSString *)sureText cancleText:(NSString *)cancleText sure:(void(^)(UIAlertAction *action))sure canle:(void(^)(UIAlertAction *action))canle;
/**
 提示
 **/
+ (void)alert:(NSString *)message sure:(void(^)(UIAlertAction *action))sure canle:(void(^)(UIAlertAction *action))canle;

+ (void)alert:(NSString *)message sure:(void(^)(UIAlertAction *action))sure;

@end
