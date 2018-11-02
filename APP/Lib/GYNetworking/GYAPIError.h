//
//  SYHAPIError.h
//  SYHGameSDK
//
//  Created by Paul on 2018/9/27.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYAPIError : NSObject

@property (nonatomic,assign) NSString *code;  // 错误码
@property (nonatomic,copy)   NSString *describe;  // 错误码解释

+ (instancetype)initWithCode:(NSString *)code;

@end
