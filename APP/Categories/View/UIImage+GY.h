//
//  UIImage+GY.h
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (GY)

/**
 创建斜下渐变照片
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param size 尺寸
 @return 返回照片
 */
+ (UIImage *)imageGradualOblique:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size;

/**
 创建竖向渐变照片
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param size 尺寸
 @return 返回照片
 */
+ (UIImage *)imageGradualVertical:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size;

/**
 创建横向渐变照片
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param size 尺寸
 @return 返回照片
 */

+ (UIImage *)imageGradualHorizontal:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size;


/**
 创建渐变照片
 @param startPoint 开始位置
 @param endPoint 结束位置
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param size 尺寸
 @return 返回照片
 */
+ (UIImage *)imageGradual:(CGPoint)startPoint endPoint:(CGPoint)endPoint startColor:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
