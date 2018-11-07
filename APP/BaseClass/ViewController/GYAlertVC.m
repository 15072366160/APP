//
//  GYAlertVC.m
//  APP
//
//  Created by Paul on 2018/11/6.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYAlertVC.h"

@interface GYAlertVC ()<UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,assign) GYOptionsMode options; // 转场动画
@property (nonatomic,assign) BOOL isShowKeyboard; // 键盘是否弹起
@property (nonatomic,strong) UIVisualEffectView *effectView; // 毛玻璃

@end

@implementation GYAlertVC

- (instancetype)initWithOptions:(GYOptionsMode)options{
    self = [super init];
    if (self) {
        self.isBlur = true;
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
        self.effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        self.effectView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:self.effectView];
    }
    
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backTap:)];
    tap.delegate = self;
    self.view.userInteractionEnabled = true;
    [self.view addGestureRecognizer:tap];
    
    //监听键盘状态
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)backTap:(UITapGestureRecognizer *)tap{
    if (self.isShowKeyboard) {
        [self.view endEditing:true];
    }else{
        if (self.isDismiss){
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }
}

#pragma mark -- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if (touch.view == self.view || touch.view == self.effectView) {
        return true;
    }
    return false;
}

- (void)showKeyboard:(NSNotification *)noti{
    self.isShowKeyboard = true;
}

- (void)hideKeyboard:(NSNotification *)noti{
    self.isShowKeyboard = false;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[GYTransition alloc] initWithMode:GYTransitionModePresent duration:0.35 options:self.options];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[GYTransition alloc] initWithMode:GYTransitionModeDismiss duration:0.2 options:self.options];
}

- (void)dealloc{
    NSLog(@"%@ 已经销毁",NSStringFromClass([self class]));
    
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


@end
