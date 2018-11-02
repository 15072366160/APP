//
//  NSUserDefaults+Category.h
//  SYHGameSDK
//
//  Created by Paul on 2018/10/8.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Category)

// 本地缓存基本数据
+ (void)addValue:(id)value key:(NSString *)key;

// 获取缓存数据
+ (id)objectForKey:(NSString *)key;

@end
