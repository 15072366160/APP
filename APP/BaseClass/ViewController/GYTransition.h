//
//  GYTransition.h
//  GYGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 GY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GYTransitionMode) {
    GYTransitionModePresent, // 进入
    GYTransitionModeDismiss  // 退出
};

typedef NS_ENUM(NSUInteger, GYOptionsMode) {
    GYOptionsModeNone = 0,   // 默认类型
    GYOptionsModeCrossDissolve,  // 渐入渐出类型
    GYOptionsModeFromLeft   // 从左边弹出类型
};

@interface GYTransition : NSObject<UIViewControllerAnimatedTransitioning>


/**
 初始化对象
 @param mode 进入（present）或者退出（dismiss）
 @param duration 时间内完成动作
 @param options 转场动画类型
 @return return
 */
- (instancetype)initWithMode:(GYTransitionMode)mode duration:(NSTimeInterval)duration options:(GYOptionsMode)options;

@end

