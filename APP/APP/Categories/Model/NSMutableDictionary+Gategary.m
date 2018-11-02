//
//  NSMutableDictionary+Gategary.m
//  SYHGameSDK
//
//  Created by Paul on 2018/10/8.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "NSMutableDictionary+Gategary.h"

@implementation NSMutableDictionary (Gategary)

- (void)addValue:(id)value key:(id)key{
    if (value == nil || key == nil) {
        GYLog(@"参数:key=%@,value=%@不存在，未添加到NSMutableDictionary",key,value);
        return;
    }
    
    [self setValue:value forKey:key];
}

@end
