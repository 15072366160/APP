//
//  GYAlertVC.m
//  APP
//
//  Created by Paul on 2018/11/6.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYAlertVC.h"

@interface GYAlertVC ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong,readwrite) UIView *contentView;
@property (nonatomic,assign) GYOptionsMode options;
@property (nonatomic,assign) BOOL isShowKeyboard;

@end

@implementation GYAlertVC

- (instancetype)initWithOptions:(GYOptionsMode)options{
    self = [super init];
    if (self) {
        self.options = options;
        self.modalPresentationStyle = UIModalPresentationCustom;
        if (options != GYOptionsModeNone) {
            self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            self.transitioningDelegate = self;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    if (self.isBlur) {
        /*
         毛玻璃的样式(枚举)
         UIBlurEffectStyleExtraLight,
         UIBlurEffectStyleLight,
         UIBlurEffectStyleDark
         */
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:effectView];
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[GYTransition alloc] initWithMode:GYTransitionModePresent duration:0.25 options:self.options];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[GYTransition alloc] initWithMode:GYTransitionModeDismiss duration:0.15 options:self.options];
}

- (void)dealloc{
    NSLog(@"%@ 已经销毁",NSStringFromClass([self class]));
}


@end
