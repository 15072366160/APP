//
//  MaPhotosItem.m
//  APP
//
//  Created by Paul on 2018/11/29.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaPhotosItem.h"

@implementation MaPhotosItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    self.imgView = [[UIImageView alloc]init];
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.imgView.clipsToBounds = true;
    self.imgView.backgroundColor = LINE_COLOR_2;
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn setImage:@"未选择" selImg:@"已选择"];
    self.btn.hidden = true;
    [self.contentView addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.width.height.mas_equalTo(35);
    }];
}

- (void)setModel:(MaPhotosModel *)model{
    _model = model;
    self.imgView.image = [UIImage imageWithContentsOfFile:model.path];
    self.btn.selected = model.isSeleted;
}


@end
