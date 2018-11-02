//
//  GYPopverVC.h
//  Presnet
//
//  Created by Paul197309 on 2017/9/10.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSeletedBlock)(NSInteger index);

@interface GYPopverVC : UITableViewController

@property (nonatomic,strong) UIColor *textColor;  // 字体颜色
@property (nonatomic,strong) UIColor *lineColor;  // 线条颜色
@property (nonatomic,strong) UIFont *font;  // 字大小
@property (nonatomic,strong) UIColor *cellBackgroundColor;  // cell颜色
@property (nonatomic,assign) CGFloat cellHeight;  // cell 高度  默认 44.0
@property (nonatomic,assign) CGFloat cellWidth;  // cell 宽度 默认 140.0
@property (nonatomic,assign) NSInteger maxRows; // 默认 10 列

@property (nonatomic,assign) UIEdgeInsets separatorInset; // line 位置

/**
 实例化对象
 @param imgs 照片数组
 @param texts 标题数组
 @param touchView 当前点击按钮
 @param block 选择回调
 @return 返回实例对象
 */
- (instancetype)initWithImgs:(NSArray <NSString *>*)imgs texts:(NSArray <NSString *>*)texts touchView:(id)touchView didSelectedIndex:(DidSeletedBlock)block;

/**
 展示popverView
 @param vc 从哪个UIViewController上展示
 @param completion 展示完回调
 */
- (void)showFromVC:(UIViewController *)vc completion:(void (^)(void))completion;

@end
