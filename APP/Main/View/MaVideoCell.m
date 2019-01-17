//
//  MaVideoCell.m
//  APP
//
//  Created by Paul on 2018/11/28.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaVideoCell.h"

@implementation MaVideoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CGFloat space = 12;
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = FONT_12;
    self.timeLabel.textColor = TEXT_COLOR_1;
    [self.contentView addSubview:self.timeLabel];
    
    self.durationLabel = [[UILabel alloc] init];
    self.durationLabel.font = FONT_12;
    self.durationLabel.textColor = TEXT_COLOR_1;
    self.durationLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.durationLabel];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(space);
        make.height.mas_equalTo(40);
        make.right.mas_equalTo(self.durationLabel.mas_left).offset(0);
    }];
    
    [self.durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-space);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(self.timeLabel.mas_width);
    }];
    
    self.imgView = [[UIImageView alloc]init];
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.imgView.clipsToBounds = true;
    self.imgView.backgroundColor = LINE_COLOR_2;
    self.imgView.userInteractionEnabled = true;
    [self.contentView addSubview:self.imgView];
    self.imgView.image = [UIImage imageNamed:@"loading_bgView"];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space);
        make.right.mas_equalTo(-space);
        make.bottom.mas_equalTo(self.timeLabel.mas_top).offset(0);
        make.height.mas_equalTo((SCREEN_WIDTH - space * 2) * 0.5625);
    }];
    
    self.label = [[UILabel alloc] init];
    self.label.font = FONT_16;
    self.label.textColor = TEXT_COLOR_3;
    [self.contentView addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-space);
        make.bottom.mas_equalTo(self.imgView.mas_top).offset(-8);
    }];

    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.imgView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imgView);
        make.width.height.mas_equalTo(50);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ediTap:)];
    self.label.userInteractionEnabled = true;
    [self.label addGestureRecognizer:tap];
}

- (void)ediTap:(UITapGestureRecognizer *)tap{
    if (self.block) {
        self.block(tap.view);
    }
}

- (void)setModel:(MaVideoModel *)model {
    _model = model;
    
    self.label.text = model.name;
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.time];
    self.timeLabel.text = [NSString stringWithFormat:@"上次播放：%@",[fmt stringFromDate:date]];
    
    self.durationLabel.text = [self getTime:model.duration];
}

- (NSString *)getTime:(NSInteger)time{
    if (time < 60) {
        return [NSString stringWithFormat:@"上次播放到：%ld秒",(long)time];
    } else if (time >= 60 && time < 3600){
        NSInteger min = time / 60;
        NSInteger sec = time % 60;
        return [NSString stringWithFormat:@"上次播放到：%ld分%ld秒",(long)min,(long)sec];
    }else{
        NSInteger h = time / 3600;
        time = time - h * 3600;
        NSInteger min = time / 60;
        NSInteger sec = time % 60;
        return [NSString stringWithFormat:@"上次播放到：%ld小时%ld分%ld秒",(long)h,(long)min,(long)sec];
    }
}

- (void)playBtnAction:(UIButton *)sender {
    
    if (self.playBlock) {
        self.playBlock(sender);
    }
}

@end
