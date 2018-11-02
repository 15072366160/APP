//
//  SYHScreen.m
//  SYHGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "GYScreen.h"

typedef NS_ENUM(NSUInteger, SYHScreenMode) {
    iPhone_5S_SE        = 568,
    iPhone_6_6S_7_8     = 667,
    iPhone_6P_6SP_7P_8P = 736,
    iPhone_X_Xs         = 812,
    iPhone_Xr_XsMax     = 896,
};

@interface GYScreen ()

@property (nonatomic,assign) SYHScreenMode mode;

@end

@implementation GYScreen

static GYScreen *instance;
+ (instancetype)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        NSInteger height = size.height > size.width ? size.height : size.width;
        instance.mode = height;
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return instance;
}

- (CGFloat)width{
    switch (self.mode) {
        case iPhone_5S_SE:        return 320;
            break;
        case iPhone_Xr_XsMax:
        case iPhone_6P_6SP_7P_8P: return 414;
            break;
        default:                  return 375;
            break;
    }
}

- (CGFloat)ratio{
    switch (self.mode) {
        case iPhone_5S_SE:        return 320.0 / 375.0;
            break;
        case iPhone_Xr_XsMax:
        case iPhone_6P_6SP_7P_8P: return 414.0 / 375.0;
            break;
        default:                  return 1;
            break;
    }
}

- (CGFloat)navBarH{
    switch (self.mode) {
        case iPhone_Xr_XsMax:
        case iPhone_X_Xs:     return 88;
        default:              return 64;
            break;
    }
}

- (CGFloat)navBarAddH{
    switch (self.mode) {
        case iPhone_Xr_XsMax:
        case iPhone_X_Xs:     return 24;
        default:              return 0;
            break;
    }
}

- (CGFloat)navStatusH{
    switch (self.mode) {
        case iPhone_Xr_XsMax:
        case iPhone_X_Xs:     return 44;
        default:              return 20;
            break;
    }
}

- (CGFloat)tabBarH{
    switch (self.mode) {
        case iPhone_Xr_XsMax:
        case iPhone_X_Xs:     return 83;
        default:              return 49;
            break;
    }
}

- (CGFloat)tabBarAddH{
    switch (self.mode) {
        case iPhone_Xr_XsMax:
        case iPhone_X_Xs:     return 34;
        default:              return 0;
            break;
    }
}

- (SYHScreenOrientation)orientation{
    
    if (_orientation != SYHScreenOrientationNone) {
        return _orientation;
    }
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        _orientation = SYHScreenOrientationVertical;
    }else if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight){
        
        _orientation = SYHScreenOrientationHorizontal;
    }else{
        _orientation = SYHScreenOrientationNone;
    }
    
    return _orientation;
}

- (CGFloat)orientationRatio{
    switch (self.orientation) {
        case SYHScreenOrientationVertical:    return  0.7;
            break;
        case SYHScreenOrientationHorizontal:  return  0.6;
            break;
        default: return 1;
            break;
    }
}

@end
