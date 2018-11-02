//
//  UIScrollView+GY.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/7/24.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GY)

- (void)addHeaderTarget:(id)target Action:(SEL)action;

- (void)addFooterTarget:(id)target Action:(SEL)action;

@end
