//
//  SYHCommon.h
//  SYHGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GYCommon : NSObject


/**
 获取当前显示的ViewController
 */
+ (UIViewController *)currentViewController;

//去掉emoji
+(NSString *)pregReplaceEmojiWithString:(NSString *)string;


@end
