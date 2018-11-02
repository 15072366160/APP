//
//  UIViewController+GY.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/5/22.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Categories)
/**
 设置背景色
 **/
- (void)setBackgroundColor:(UIColor *)color;

/**
 push到下一页
 **/
- (void)push:(UIViewController *)vc;

/**
 pop到上一页
 **/
- (void)pop;

/**
 present到下一页
 **/
- (void)present:(UIViewController *)vc;

/**
 dismiss到上一页
 **/
- (void)dismiss;

/**
 pop返回按钮
 **/
- (void)addPopItem;

/**
 dismss返回按钮
 **/
- (void)addDismissItem;

/**
 添加右边文字按钮
 **/
- (void)addRightTitleItem:(NSString *)text target:(id)target action:(SEL)action;

/**
 添加右边照片按钮
 **/
- (void)addRightImgItem:(NSString *)img target:(id)target action:(SEL)action;

/**
 设置界面风格
 **/
- (void)setViewStyle;

/**
 快速创建VC
 **/
+ (id)shareNibName:(NSString *)nibName;

/**
 设置状态栏颜色
 **/
- (void)setStatusBarBackgroundColor:(UIColor *)color;

/**返回是否可以调用相机**/
+ (BOOL)isPermissionWhetherThereViewController:(UIViewController *)vc;

/**添加左边item**/
- (void)addLeftItemWithObj:(id)obj;

/**返回调用**/
- (void)leftItem:(UIBarButtonItem *)leftItem;

/**添加右边item**/
- (void)addRightItemWithObj:(id)obj;

/**右边item点击**/
- (void)rightItme:(UIBarButtonItem *)rightItem;


@end
