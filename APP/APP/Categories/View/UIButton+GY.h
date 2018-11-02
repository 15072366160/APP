//
//  UIButton+GY.h
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/4/28.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GY)
/**
 快速设置Button
 **/
+ (UIButton *)buttonFrame:(CGRect)frame title:(NSString *)text image:(NSString *)image targrt:(id)targrt action:(SEL)action;

/**
 快速设置选择状态Img
 **/
- (void)setImage:(NSString *)norImg selImg:(NSString *)selImg;

/**
 快速设置高亮状态Img
 **/
- (void)setImage:(NSString *)norImg lightImg:(NSString *)lightImg;

/**
 快速设置选择状态背景
 **/
- (void)setBackgroundImage:(NSString *)norImg selImg:(NSString *)selImg;

/**
 快速设置高亮状态背景
 **/
- (void)setBackgroundImage:(NSString *)norImg lightImg:(NSString *)lightImg;

/**
 UIButton 居中
 **/
- (void)verticalImageAndTitle:(CGFloat)spacing;

/**
 快速设置选择非选择下的title
 **/
- (void)setTitle:(NSString *)norText selTitle:(NSString *)selText;

/**
 快速设置选择非选择下的title 颜色
 **/
- (void)setTitleColor:(UIColor *)norColor selTitleColor:(UIColor *)selColor;

@end
