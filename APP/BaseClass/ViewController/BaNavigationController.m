//
//  BaNavigationController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "BaNavigationController.h"

@interface BaNavigationController ()

@end

@implementation BaNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageGradualOblique:HEX_COLOR(@"#02AAB0") endColor:HEX_COLOR(@"#00CDAC") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.tintColor = WHITE_COLOR;
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
//    [self skidBack];
}

- (void)skidBack{
    //设置侧滑返回上一页
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

@end
