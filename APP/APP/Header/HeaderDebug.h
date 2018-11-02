
//
//  HeaderDebug.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderDebug_h
#define HeaderDebug_h

// 是否处于DEBUG阶段,注释掉则为正式环境
#define GY_DEBUG


#ifdef GY_DEBUG
// 处于开发阶段

#define GYLog(...)                NSLog(__VA_ARGS__)
#define GYLog_delloc(obj)         NSLog(@"%@被销毁",NSStringFromClass([obj class]))

#else
// 处于发布阶段

#define GYLog(...)
#define GYLog_delloc(...)

#endif


#endif /* HeaderDebug_h */
