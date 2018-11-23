//
//  GYTableViewCell.h
//  APP
//
//  Created by Paul on 2018/11/16.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const GYTableViewCellID = @"GYTableViewCellID";

@interface GYTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImageView *imgView;

@end

NS_ASSUME_NONNULL_END
