//
//  SYHScreen.h
//  SYHGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SYHScreenOrientation) {
    SYHScreenOrientationNone = 0,        // 不确定
    SYHScreenOrientationVertical,    // 竖屏
    SYHScreenOrientationHorizontal   // 横屏
};

@interface GYScreen : NSObject

// 返回指定屏幕的宽度
@property (nonatomic,assign) CGFloat width;

// 宽度相对于 6s 375的比例
@property (nonatomic,assign) CGFloat ratio;

// NavBar的高度
@property (nonatomic,assign) CGFloat navBarH;

// NavBar X增加的高度
@property (nonatomic,assign) CGFloat navBarAddH;

// nav Status的高度
@property (nonatomic,assign) CGFloat navStatusH;

// tabBar的高度
@property (nonatomic,assign) CGFloat tabBarH;

// tabBar X增加的高度
@property (nonatomic,assign) CGFloat tabBarAddH;

// 横屏 竖屏
@property (nonatomic,assign) SYHScreenOrientation orientation;

// 横屏 竖屏 比例
@property (nonatomic,assign) CGFloat orientationRatio;


+ (instancetype)shared;

@end
