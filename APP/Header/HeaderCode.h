//
//  HeaderCode.h
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/10/27.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#ifndef HeaderCode_h
#define HeaderCode_h

// 字体
#define FONT_SYSTEM(value)      [UIFont systemFontOfSize:value]
#define FONT_BOLD(value)        [UIFont boldSystemFontOfSize:value]

#define FONT_30                  FONT_SYSTEM(30)
#define FONT_20                  FONT_SYSTEM(20)
#define FONT_18                  FONT_SYSTEM(18)
#define FONT_16                  FONT_SYSTEM(16)
#define FONT_14                  FONT_SYSTEM(14)
#define FONT_12                  FONT_SYSTEM(12)
#define FONT_10                  FONT_SYSTEM(10)

// GCD
// 异步线程
#define ASYNC_GLOBAL_GCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
// 主线程
#define ASYNC_MAIN_GCD(block)   dispatch_async(dispatch_get_main_queue(),block)

// NSUserDefaults
#define NSUSERDEFAULT           [NSUserDefaults standardUserDefaults]

// 关闭自动调节尺寸
#define ADJUSTINSETS_NO(scrollView) if(IS_iOS11){scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;}else{self.automaticallyAdjustsScrollViewInsets = false;}

//当前APP版本
#define CurrentVersion [[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey] substringToIndex:([[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey] length]-5)]

//获取通知中心
#define GYNOTI [NSNotificationCenter defaultCenter]


/**
 *  the saving objects      存储对象
 *
 *  @param __VALUE__ V
 *  @param __KEY__   K
 *
 *  @return
 */
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  get the saved objects       获得存储的对象
 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#endif /* HeaderCode_h */
