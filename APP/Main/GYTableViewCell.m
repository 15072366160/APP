//
//  GYTableViewCell.m
//  APP
//
//  Created by Paul on 2018/11/16.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYTableViewCell.h"

@implementation GYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.imgView = [[UIImageView alloc] init];
    self.imgView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imgView];
    
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.textColor = [UIColor blackColor];
    self.label.numberOfLines = 0;
    self.label.backgroundColor = [UIColor yellowColor];
    [self.imgView addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
}

@end
