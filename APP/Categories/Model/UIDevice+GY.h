//
//  UIDevice+GY.h
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (GY)

// 设备型号
+ (NSString *)modelName;

// 设备品牌
+ (NSString *)brand;

@end

NS_ASSUME_NONNULL_END
