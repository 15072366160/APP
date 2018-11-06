//
//  GYTransition.m
//  GYGameSDK
//
//  Created by Paul on 2018/10/12.
//  Copyright © 2018年 GY. All rights reserved.
//

#import "GYTransition.h"

@interface GYTransition ()

@property (nonatomic, assign) GYTransitionMode mode;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) GYOptionsMode options;

@end

@implementation GYTransition

- (instancetype)initWithMode:(GYTransitionMode)mode duration:(NSTimeInterval)duration options:(GYOptionsMode)options{
    
    self = [super init];
    if (self) {
        self.mode     = mode;
        self.duration = duration;
        self.options  = options;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.mode) {
        case GYTransitionModePresent: [self presentWithContext:transitionContext];
            break;
        case GYTransitionModeDismiss: [self dismissWithContext:transitionContext];
            break;
    }
}

- (void)presentWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.options) {
        case GYOptionsModeFromLeft: [self presentFromLeft:transitionContext];
            break;
        case GYOptionsModeCrossDissolve: [self presentCrossDissolve:transitionContext];
            break;
        default:  [transitionContext completeTransition:true];
            break;
    }
}

- (void)dismissWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.options) {
        case GYOptionsModeFromLeft: [self dismissFromLeft:transitionContext];
            break;
        case GYOptionsModeCrossDissolve: [self dismissCrossDissolve:transitionContext];
            break;
        default:  [transitionContext completeTransition:true];
            break;
    }
}

- (void)presentCrossDissolve:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    // 设置呈现的高度
    toVC.view.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height);
    // 开始动画
    [containerView addSubview:toVC.view];
    [UIView transitionWithView:toVC.view duration:self.duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:true];
    }];
}

- (void)dismissCrossDissolve:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    // 开始动画
    [UIView transitionWithView:containerView duration:self.duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        containerView.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:true];
    }];
}

- (void)presentFromLeft:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.view];
    // 设置呈现的高度
    toVC.view.frame = CGRectMake(-containerView.frame.size.width, 0, containerView.frame.size.width, containerView.frame.size.height);
    // 开始动画
    [UIView animateWithDuration:self.duration animations:^{
        
        toVC.view.transform = CGAffineTransformMakeTranslation(containerView.frame.size.width, 0);
        containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.15];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:true];
    }];
}

- (void)dismissFromLeft:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    // 开始动画
    [UIView animateWithDuration:self.duration animations:^{
        
        fromVC.view.transform = CGAffineTransformIdentity;
        containerView.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:true];
    }];
}

- (void)dealloc{
    NSLog(@"Class：%@ 已经被销毁",NSStringFromClass(self.class));
}

@end
