//
//  NSUserDefaults+Category.m
//  SYHGameSDK
//
//  Created by Paul on 2018/10/8.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "NSUserDefaults+Category.h"

@implementation NSUserDefaults (Category)

+ (void)addValue:(id)value key:(NSString *)key{
    if (value == nil || key == nil) {
        GYLog(@"参数:key=%@,value=%@不存在，未添加到NSUserDefaults",key,value);
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key{
    if (key == nil) {
        GYLog(@"参数:key=%@不存在，未从NSUserDefaults读取到",key);
        return nil;
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end
