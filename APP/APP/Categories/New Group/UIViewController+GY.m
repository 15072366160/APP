//
//  UIViewController+GY.m
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/5/22.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UIViewController+GY.h"
#import <AVFoundation/AVCaptureDevice.h>

#define IS_VAILABLE_IOS8  ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)


@implementation UIViewController (Categories)

/**
 设置背景色
 **/
- (void)setBackgroundColor:(UIColor *)color{
    self.view.backgroundColor = color;
}

/**
 push到下一页
 **/
- (void)push:(UIViewController *)vc{
    [self.navigationController pushViewController:vc animated:true];
}

/**
 pop到上一页
 **/
- (void)pop{
    [self.navigationController popViewControllerAnimated:true];
}

/**
 present到下一页
 **/
- (void)present:(UIViewController *)vc{
    [self presentViewController:vc animated:true completion:nil];
}

/**
 dismiss到上一页
 **/
- (void)dismiss{
    [self dismissViewControllerAnimated:true completion:nil];
}

/**
 pop返回按钮
 **/
- (void)addPopItem{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

/**
 dismss返回按钮
 **/
- (void)addDismissItem{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

/**
 添加右边文字按钮
 **/
- (void)addRightTitleItem:(NSString *)text target:(id)target action:(SEL)action{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStyleDone target:target action:action];
    self.navigationItem.rightBarButtonItem = right;
}

/**
 添加右边照片按钮
 **/
- (void)addRightImgItem:(NSString *)img target:(id)target action:(SEL)action{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:target action:action];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)setViewStyle{}

+ (id)shareNibName:(NSString *)nibName{
    Class class = NSClassFromString(nibName);
    id vc = [[class alloc]initWithNibName:nibName bundle:nil];
    return vc;
}


//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

/**返回是否可以调用相机**/
+ (BOOL)isPermissionWhetherThereViewController:(UIViewController *)vc{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus ==AVAuthorizationStatusRestricted ||//此应用程序没有被授权访问的照片数据。可能是家长控制权限
        authStatus ==AVAuthorizationStatusDenied)  //用户已经明确否认了这一照片数据的应用程序访问
    {
        if (IS_VAILABLE_IOS8) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"舍友\"访问您的相机." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [vc presentViewController:alert animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"相机权限受限" message:@"请在iPhone的\"设置->隐私->相机\"选项中,允许\"舍友\"访问您的相机." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [vc presentViewController:alert animated:YES completion:nil];
        }
        return NO;
    }else{
        return YES;
    }
}

- (void)addLeftItemWithObj:(id)obj{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    [leftBtn addTarget:self action:@selector(leftItem:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([obj isKindOfClass:[UIImage class]]) {
        [leftBtn setImage:(UIImage *)obj forState:0];
        leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 8);
    }
    
    if ([obj isKindOfClass:[NSString class]]){
        [leftBtn setTitle:(NSString *)obj forState:0];
        [leftBtn setTitleColor:[UIColor whiteColor] forState:0];
        leftBtn.titleLabel.font = FONT_SYSTEM(16);
    }
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)addRightItemWithObj:(id)obj{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    [rightBtn addTarget:self action:@selector(rightItme:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([obj isKindOfClass:[UIImage class]]) {
        [rightBtn setImage:(UIImage *)obj forState:0];
        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 8);
    }
    
    if ([obj isKindOfClass:[NSString class]]){
        [rightBtn setTitle:(NSString *)obj forState:0];
        [rightBtn setTitleColor:[UIColor whiteColor] forState:0];
        rightBtn.titleLabel.font = FONT_SYSTEM(16);
    }
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)rightItme:(id)rightItem{
    
}

- (void)leftItem:(id)leftItem{
    [self pop];
}

@end

