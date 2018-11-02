//
//  UICollectionView+GY.m
//  ZZJ_V3
//
//  Created by Paul197309 on 2017/10/27.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "UICollectionView+GY.h"

@implementation UICollectionView (GY)

- (void)registerWithNibName:(NSString *)name{
    [self registerWithNibName:name identifier:name];
}

- (void)registerWithNibName:(NSString *)name identifier:(NSString *)identifier{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)registerWithClassName:(NSString *)name{
    [self registerWithClassName:name identifier:name];
}

- (void)registerWithClassName:(NSString *)name identifier:(NSString *)identifier{
    [self registerClass:NSClassFromString(name) forCellWithReuseIdentifier:identifier];
}

- (void)registerHeaderWithNibName:(NSString *)name{
    [self registerHeaderWithNibName:name identifier:name];
}

- (void)registerHeaderWithNibName:(NSString *)name identifier:(NSString *)identifier{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
}

- (void)registerHeaderWithClassName:(NSString *)name{
    [self registerHeaderWithClassName:name identifier:name];
}

- (void)registerHeaderWithClassName:(NSString *)name identifier:(NSString *)identifier{
    [self registerClass:NSClassFromString(name) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
}

- (void)registerFooterWithNibName:(NSString *)name{
    [self registerFooterWithNibName:name identifier:name];
}

- (void)registerFooterWithNibName:(NSString *)name identifier:(NSString *)identifier{
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier];
}

- (void)registerFooterWithClassName:(NSString *)name{
    [self registerFooterWithClassName:name identifier:name];
}

- (void)registerFooterWithClassName:(NSString *)name identifier:(NSString *)identifier{
    [self registerClass:NSClassFromString(name) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier];
}

@end
