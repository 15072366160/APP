//
//  UIView+GY.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/5/21.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
/**
 *  UIView 扩展
 */
@interface UIView (TT)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;
/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 *  取消阴影
 */
- (void)hideShadow;

/**
 *  设置阴影
 *
 *  @param color   颜色
 *  @param offset  位移
 *  @param radius  大小
 *  @param opacity 透明度
 */
- (void)shadowColor:(UIColor*)color shadowOffset:(CGSize)offset shadowRadius:(CGFloat)radius shadowOpacity:(CGFloat)opacity;

/**
 *  设置圆角、边框
 *
 *  @param radius 圆角大小
 *  @param width  边框大小
 *  @param color  边框颜色
 */
- (void)cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color;

/**
 *  设置阴影、圆角、边框
 *
 *  @param shadowColor 阴影颜色
 *  @param offset      阴影位移
 *  @param sradius     阴影大小
 *  @param opacity     阴影透明度
 *  @param cradius     圆角大小
 *  @param width       边框大小
 *  @param borderColor 边框颜色
 */
- (void)shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)offset shadowRadius:(CGFloat)sradius shadowOpacity:(CGFloat)opacity
       cornerRadius:(CGFloat)cradius borderWidth:(CGFloat)width borderColor:(UIColor *)borderColor;

- (void)shake;

/**
 *  截取当前 view 的截图
 *
 *  @return.
 */
- (UIImage *)viewToImage;

/**
 画圆
 **/
- (void)cor;
/**
 导圆角
 **/
- (void)corRadius:(CGFloat)radius;
/**
 加边框
 **/
- (void)borW:(CGFloat)width color:(UIColor *)color;

/**
 斜下
 @param startColor 开始颜色
 @param endColor 结束颜色
 */
- (void)gradualOblique:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 竖向
 @param startColor 开始颜色
 @param endColor 结束颜色
 */
- (void)gradualVertical:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 横向
 @param startColor 开始颜色
 @param endColor 结束颜色
 */
- (void)gradualHorizontal:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 设置渐变色
 @param startPoint 开始位置 （0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
 @param endPoint 结束位置（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
 @param startColor 开始颜色
 @param endColor 结束颜色
 */
- (void)gradual:(CGPoint)startPoint endPoint:(CGPoint)endPoint startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/**
 四周添加阴影
 @param color 阴影颜色
 */
- (void)shadowWithColor:(UIColor *)color;

/**
 设置圆角
 @param radius 圆角半径
 @param corners 圆角方位
 */
- (void)corWithRadius:(CGFloat)radius corners:(UIRectCorner)corners;



@end
