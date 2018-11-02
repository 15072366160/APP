
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
#define DEV                      [UIDevice currentDevice]
// 手机系统版本
#define DEV_SYSTEM_VERSION       [DEV systemVersion] floatValue]
// 手机序列号
#define IDENTIFIERNUMBER         [DEV uniqueIdentifier]
// 手机别名： 用户定义的名称
#define DEV_ALIAS                [DEV name]
// 设备名称
#define DEV_NAME                 [DEV systemName]
// 手机型号
#define DEV_MODEL                [DEV model]
// 地方型号  （国际化区域名称）
#define DEV_LOCALIZE_MODEL       [DEV localizedModel]
// 设备UUID
#define DEV_UUID                 [DEV identifierForVendor].UUIDString
// 设备型号名称
#define DEV_MODELNAME            [UIDevice modelName]
// 设备类型
#define DEV_BRAND                [UIDevice brand]
// 设备IDFV
#define DEV_IDFV                 [DEV identifierForVendor].UUIDString
// 设备Sn
#define Device_Sn                [DEV identifierForVendor].UUIDString
// 设备IDFA
#define DEV_IDFA                 [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]


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







