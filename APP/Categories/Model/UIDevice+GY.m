//
//  UIDevice+GY.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "UIDevice+GY.h"
#import <sys/utsname.h>

@implementation UIDevice (GY)

+ (NSString *)modelName{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"x86_64"])     return @"Simulator";
    if ([platform isEqualToString:@"i386"])       return @"Simulator";
    if ([platform isEqualToString:@"iPhone1,1"])  return @"iPhone";
    if ([platform isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])  return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])  return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"])  return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"])  return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    return platform;
}

+ (NSString *)brand{
    switch ([UIDevice currentDevice].userInterfaceIdiom) {
        case UIUserInterfaceIdiomPhone:   return @"iPhone";
            break;
        case UIUserInterfaceIdiomPad:     return @"iPad";
            break;
        case UIUserInterfaceIdiomTV:      return @"iTV";
            break;
        case UIUserInterfaceIdiomCarPlay: return @"iCarPlay";
            break;
        default:                          return @"未知设备";
            break;
    }
}

@end
