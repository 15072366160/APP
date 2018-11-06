//
//  GYNvigationController.h
//  APP
//
//  Created by Paul on 2018/11/6.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYAlertVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYNavigationController : GYAlertVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController option:(GYOptionsMode)option frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
