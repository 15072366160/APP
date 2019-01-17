//
//  MaVideoCell.h
//  APP
//
//  Created by Paul on 2018/11/28.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaVideoModel.h"

static NSString *const MaVideoCellId = @"MaVideoCell";

NS_ASSUME_NONNULL_BEGIN

@interface MaVideoCell : UITableViewCell

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) UILabel *durationLabel;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic, strong) UIButton *playBtn;
/** model */
@property (nonatomic, strong) MaVideoModel *model;
/** 播放按钮block */
@property (nonatomic, copy) void(^playBlock)(UIButton *);

/** 修改名称 */
@property (nonatomic, copy) BKIdBlock block;

@end

NS_ASSUME_NONNULL_END
