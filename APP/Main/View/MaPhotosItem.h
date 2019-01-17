//
//  MaPhotosItem.h
//  APP
//
//  Created by Paul on 2018/11/29.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MaPhotosModel.h"

static NSString *const MaPhotosItemId = @"MaPhotosItem";

NS_ASSUME_NONNULL_BEGIN

@interface MaPhotosItem : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) MaPhotosModel *model;

@property (nonatomic,strong) UIButton *btn;

@end

NS_ASSUME_NONNULL_END
