//
//  HeaderUI.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderUI_h
#define HeaderUI_h

// 1像素线宽
#define LINE_WIDTH              1.f / [UIScreen mainScreen].scale

// 屏幕尺寸
#define SCREEN_BOUNDS           [[UIScreen mainScreen] bounds]
#define SCREEN_SIZE             [[UIScreen mainScreen] bounds].size
#define SCREEN_WIDTH            [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT           [[UIScreen mainScreen] bounds].size.height

// 设备高度 判断设备
#define IS_IPHONE_4_4S          (SCREEN_HEIGHT == 480.0)
#define IS_IPHONE_5S_5SE        (SCREEN_HEIGHT == 568.0)
#define IS_IPHONE_6_6S_7_8      (SCREEN_HEIGHT == 667.0)
#define IS_IPHONE_6P_6SP_7P_8P  (SCREEN_HEIGHT == 736.0)
#define IS_IPHONE_X_Xs          (SCREEN_HEIGHT == 812.0)
#define IS_IPHONE_Xr_XsMax      (SCREEN_HEIGHT == 896.0)

#endif /* HeaderUI_h */
