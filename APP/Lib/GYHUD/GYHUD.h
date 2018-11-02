//
//  GY_HUD.h
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/5/17.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>
#import "GYAPIError.h"

@interface GYHUD : SVProgressHUD

/**
 加载转圈 不会自动消失
 **/
+ (void)_show;

/**
 立刻消失
 **/
+ (void)_dismiss;

/**
 多久消失
 **/
+ (void)_dismissWithDelay:(NSTimeInterval)delay;

/**
 加载中...圈圈
 **/
+ (void)_showWithStatus:(NSString*)status;

/**
 加载百分比 99%
 **/
+ (void)_showProgress:(float)progress;

/**
 加载百分比 99% 和 文字
 **/
+ (void)_showProgress:(float)progress status:(NSString*)status;

/**
 提示信息 ！
 **/
+ (void)_showInfoWithStatus:(NSString*)status;

/**
 提示成功 √
 **/
+ (void)_showSuccessWithStatus:(NSString*)status;

/**
 提示错误 X
 **/
+ (void)_showErrorWithStatus:(NSString*)status;

/**
 提示照片28x28 white PNGs
 **/
+ (void)_showImage:(UIImage*)image status:(NSString*)status;

/**
 检查错误
 **/
+ (void)checkError:(GYAPIError *)error;

/**
 数据请求成功
 **/
+ (void)successLoad;

@end
