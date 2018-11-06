//
//  GYAlertVC.h
//  APP
//
//  Created by Paul on 2018/11/6.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GYTransition.h"


NS_ASSUME_NONNULL_BEGIN

@interface GYAlertVC : UIViewController

/**
 是否有毛玻璃效果
 */
@property (nonatomic,assign) BOOL isBlur;

/**
 是否点击返回
 */
@property (nonatomic,assign) BOOL isDismiss;

/**
 实例化 SYHAlertVC 对象
 @param options 跳转类型
 @return return
 */
- (instancetype)initWithOptions:(GYOptionsMode)options;

@end

NS_ASSUME_NONNULL_END
