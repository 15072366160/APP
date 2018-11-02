
//
//  HeaderDefine.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderDefine_h
#define HeaderDefine_h

// 设备信息
#define CURRENTDEVICE            [UIDevice currentDevice]
//手机系统版本
#define DEV_SYSTEM_VERSION       [CURRENTDEVICE systemVersion] floatValue]
//手机序列号
#define IDENTIFIERNUMBER         [CURRENTDEVICE uniqueIdentifier]
//手机别名： 用户定义的名称
#define DEV_ALIAS                [CURRENTDEVICE name]
//设备名称
#define DEV_NAME                 [CURRENTDEVICE systemName]
//手机型号
#define DEV_MODEL                [CURRENTDEVICE model]
//地方型号  （国际化区域名称）
#define DEV_LOCALIZE_MODEL       [CURRENTDEVICE localizedModel]

#define IS_iOS7                  @available(iOS 7.0, *)
#define IS_iOS8                  @available(iOS 8.0, *)
#define IS_iOS9                  @available(iOS 9.0, *)
#define IS_iOS10                 @available(iOS 10.0, *)
#define IS_iOS11                 @available(iOS 11.0, *)
#define IS_iOS12                 @available(iOS 12.0, *)

// 弱引用
#define WEAKSELF                 __weak typeof(self) weakSelf = self
//强引用
#define STRONGSELF               __strong typeof(self) strongSelf = self

// APP 信息
#define APP_INFO                  [[NSBundle mainBundle] infoDictionary]

// 名称
#define APP_NAME                  [APP_INFO objectForKey:@"CFBundleDisplayName"]
// 版本
#define APP_VERSION               [APP_INFO objectForKey:@"CFBundleShortVersionString"]
// build版本
#define APP_BUILD                 [APP_INFO objectForKey:@"CFBundleVersion"]

#endif /* HeaderDefine_h */







