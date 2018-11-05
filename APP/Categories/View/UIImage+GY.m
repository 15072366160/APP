//
//  UIImage+GY.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "UIImage+GY.h"

@implementation UIImage (GY)

// 斜下
+ (UIImage *)imageGradualOblique:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size{
    return [self imageGradual:CGPointMake(0, 0) endPoint:CGPointMake(1.0, 1.0) startColor:startColor endColor:endColor size:size];
}

// 竖向
+ (UIImage *)imageGradualVertical:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size{
    return [self imageGradual:CGPointMake(0.0, 0.5) endPoint:CGPointMake(1.0, 0.5) startColor:startColor endColor:endColor size:size];
}

// 横向
+ (UIImage *)imageGradualHorizontal:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size{
    return [self imageGradual:CGPointMake(0.5,0.0) endPoint:CGPointMake(0.5,1.0) startColor:startColor endColor:endColor size:size];
}

+ (UIImage *)imageGradual:(CGPoint)startPoint endPoint:(CGPoint)endPoint startColor:(UIColor *)startColor endColor:(UIColor *)endColor size:(CGSize)size{
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = startPoint;//（0，0）表示从左上角开始变化。默认值是(0.5,0.0)表示从x轴为中间，y为顶端的开始变化
    layer.endPoint = endPoint;//（1，1）表示到右下角变化结束。默认值是(0.5,1.0)  表示从x轴为中间，y为低端的结束变化
    layer.colors = [NSArray arrayWithObjects:(id)startColor.CGColor,(id)endColor.CGColor, nil];
    //渐变颜色的区间分布，locations的数组长度和color一致，这个值一般不用管它，默认是nil，会平均分布
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end
