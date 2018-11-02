//
//  GY_HUD.m
//  ZZJ_Hotel
//
//  Created by Paul197309 on 2017/5/17.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "GYHUD.h"

@implementation GYHUD

+ (void)_showWithStatus:(NSString*)status{
    [self showWithStatus:status];
    [self dismissDelay];
}

+ (void)_showProgress:(float)progress{
    [self showProgress:progress];
}

+ (void)_showProgress:(float)progress status:(NSString*)status{
    [self showProgress:progress status:status];
}

+ (void)_showInfoWithStatus:(NSString*)status{
    [self showInfoWithStatus:status];
    [self dismissDelay];
}

+ (void)_showSuccessWithStatus:(NSString*)status{
    [self showSuccessWithStatus:status];
    [self dismissDelay];
}

+ (void)_showErrorWithStatus:(NSString*)status{
    [self showErrorWithStatus:status];
    [self dismissDelay];
}

// shows a image + status, use 28x28 white PNGs
+ (void)_showImage:(UIImage*)image status:(NSString*)status{
    [self showImage:image status:status];
    [self dismissDelay];
}

+ (void)dismissDelay{
    [self _dismissWithDelay:1.0];
}

+ (void)_show{
    [self show];
}

+ (void)_dismiss{
    [self dismiss];
}

+ (void)_dismissWithDelay:(NSTimeInterval)delay{
    [self dismissWithDelay:delay];
}

+ (void)checkError:(GYAPIError *)error{
    [self _showErrorWithStatus:error.describe];
}

+ (void)successLoad{
    [self _showSuccessWithStatus:@"数据请求成功"];
}

@end
