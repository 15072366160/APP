//
//  UIScrollView+GY.m
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/7/24.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UIScrollView+GY.h"
#import "MJRefresh.h"

@implementation UIScrollView (GY)

- (void)addHeaderTarget:(id)target Action:(SEL)action{
    MJRefreshNormalHeader *headerView = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    headerView.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
    headerView.stateLabel.textColor = [UIColor grayColor];
    [headerView setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [headerView setTitle:@"释放刷新" forState:MJRefreshStatePulling];
    [headerView setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    headerView.lastUpdatedTimeLabel.hidden = true;
    headerView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.mj_header = headerView;
}

- (void)addFooterTarget:(id)target Action:(SEL)action{
    MJRefreshAutoNormalFooter *footerView = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    footerView.automaticallyRefresh = true;
    footerView.stateLabel.textColor = [UIColor grayColor];
    [footerView setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [footerView setTitle:@"释放加载" forState:MJRefreshStatePulling];
    [footerView setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    footerView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.mj_footer = footerView;
}

@end
