//
//  UIButton+GY.m
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/4/28.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UIButton+GY.h"

@implementation UIButton (GY)

+ (UIButton *)buttonFrame:(CGRect)frame title:(NSString *)text image:(NSString *)image targrt:(id)targrt action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.frame = frame;
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
    }
    if (image) {
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [btn setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    if (targrt && action) {
        [btn addTarget:targrt action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

- (void)setImage:(NSString *)norImg selImg:(NSString *)selImg{
    [self setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
}

- (void)setTitle:(NSString *)norText selTitle:(NSString *)selText{
    [self setTitle:norText forState:UIControlStateNormal];
    [self setTitle:selText forState:UIControlStateSelected];
}

- (void)setTitleColor:(UIColor *)norColor selTitleColor:(UIColor *)selColor{
    [self setTitleColor:norColor forState:UIControlStateNormal];
    [self setTitleColor:selColor forState:UIControlStateSelected];
}

- (void)setImage:(NSString *)norImg lightImg:(NSString *)lightImg{
    [self setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:lightImg] forState:UIControlStateHighlighted];
}

- (void)setBackgroundImage:(NSString *)norImg selImg:(NSString *)selImg{
    [self setBackgroundImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
}

- (void)setBackgroundImage:(NSString *)norImg lightImg:(NSString *)lightImg{
    [self setBackgroundImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:lightImg] forState:UIControlStateHighlighted];
}

- (void)verticalImageAndTitle:(CGFloat)spacing
{
    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}

@end
