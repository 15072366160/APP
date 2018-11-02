//
//  UITableView+GY.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/10/27.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (GY)

/**
 Nin 注册 tableview
 @param name nibName 和 identifier 相同情况下使用
 */
- (void)registerWithNibName:(NSString *)name;

/**
 Nin 注册 tableview
 @param name NibName
 @param identifier identifier
 */
- (void)registerWithNibName:(NSString *)name identifier:(NSString *)identifier;

/**
 Class 注册 tableview
 @param name className 和 identifier 相同情况下使用
 */
- (void)registerWithClassName:(NSString *)name;

/**
 Class 注册 tableview
 @param name className
 @param identifier identifier
 */
- (void)registerWithClassName:(NSString *)name identifier:(NSString *)identifier;

@end
