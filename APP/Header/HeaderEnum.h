//
//  HeaderEnum.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderEnum_h
#define HeaderEnum_h

#import <Foundation/Foundation.h>

#pragma mark -- 支付方式
typedef NS_ENUM(NSUInteger, AppStarMode) {
    AppStarModeLaunching = 0,   // 激活
    AppStarModeActive,         // 前台
    AppStarModeNerve,          // 永不
};

#endif /* HeaderEnum.h */
