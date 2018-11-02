//
//  UICollectionView+GY.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/10/27.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (GY)

/**
 Nin 注册 UICollectionViewCell
 @param name nibName 和 identifier 相同情况下使用
 */
- (void)registerWithNibName:(NSString *)name;

/**
 Class 注册 UICollectionViewCell
 @param name className 和 identifier 相同情况下使用
 */
- (void)registerWithClassName:(NSString *)name;

/**
 Nin 注册 UICollectionView 的 HeaderView
 @param name nibName 和 identifier 相同情况下使用
 */
- (void)registerHeaderWithNibName:(NSString *)name;

/**
 Class 注册 UICollectionView 的 HeaderView
 @param name className 和 identifier 相同情况下使用
 */
- (void)registerHeaderWithClassName:(NSString *)name;

/**
 Nin 注册 UICollectionView 的 FooterView
 @param name nibName 和 identifier 相同情况下使用
 */
- (void)registerFooterWithNibName:(NSString *)name;

/**
 Class 注册 UICollectionView 的 FooterView
 @param name className 和 identifier 相同情况下使用
 */
- (void)registerFooterWithClassName:(NSString *)name;


- (void)registerWithNibName:(NSString *)name identifier:(NSString *)identifier;
- (void)registerWithClassName:(NSString *)name identifier:(NSString *)identifier;

- (void)registerHeaderWithNibName:(NSString *)name identifier:(NSString *)identifier;
- (void)registerHeaderWithClassName:(NSString *)name identifier:(NSString *)identifier;

- (void)registerFooterWithNibName:(NSString *)name identifier:(NSString *)identifier;
- (void)registerFooterWithClassName:(NSString *)name identifier:(NSString *)identifier;

@end
