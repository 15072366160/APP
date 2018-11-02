//
//  UITableView+GY.m
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/10/27.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UITableView+GY.h"

@implementation UITableView (GY)

- (void)registerWithNibName:(NSString *)name{
    [self registerWithNibName:name identifier:name];
}

- (void)registerWithNibName:(NSString *)name identifier:(NSString *)identifier{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:identifier];
}

- (void)registerWithClassName:(NSString *)name{
    [self registerWithClassName:name identifier:name];
}

- (void)registerWithClassName:(NSString *)name identifier:(NSString *)identifier{
    [self registerClass:NSClassFromString(name) forCellReuseIdentifier:identifier];
}

@end
