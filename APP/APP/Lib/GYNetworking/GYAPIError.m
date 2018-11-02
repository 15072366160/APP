//
//  SYHAPIError.m
//  SYHGameSDK
//
//  Created by Paul on 2018/9/27.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "GYAPIError.h"

@implementation GYAPIError

+ (instancetype)initWithCode:(NSString *)code{
    GYAPIError *error = [[GYAPIError alloc]init];
    error.code = code;
    return error;
}

@end
