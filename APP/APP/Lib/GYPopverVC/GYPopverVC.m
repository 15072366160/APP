//
//  GYPopverVC.m
//  Presnet
//
//  Created by Paul197309 on 2017/9/10.
//  Copyright © 2017年 Paul197309. All rights reserved.
//

#import "GYPopverVC.h"

@interface GYPopverVC ()<UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate>

//@property (nonatomic,strong) UITableView *tableView; // tableView

@property (nonatomic,copy) NSArray <NSString *>*imgs;  // 照片列表
@property (nonatomic,copy) NSArray <NSString *>*texts;  // 文字列表
@property (nonatomic,copy) DidSeletedBlock block;  // 点击 cell 回调
@property (nonatomic,strong) id touchView; // 点击的按钮

@property (nonatomic,assign,readonly) NSInteger count;
@property (nonatomic,assign,readonly) NSInteger rows;

@end

//  默认值
static CGFloat const CellHeight = 44.0;
static CGFloat const CellWidth  = 155.0;
static NSInteger const MaxRows  = 10;

@implementation GYPopverVC

- (instancetype)initWithImgs:(NSArray <NSString *>*)imgs texts:(NSArray <NSString *>*)texts touchView:(id)touchView didSelectedIndex:(DidSeletedBlock)block{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        self.imgs = imgs;
        self.texts = texts;
        self.block = block;
        self.touchView = touchView;
        
    }
    return self;
}

- (void)showFromVC:(UIViewController *)vc completion:(void (^)(void))completion{
    // 设置大小
    self.preferredContentSize = CGSizeMake(self.cellWidth, self.rows * self.cellHeight);
    // 设置 Sytle
    self.modalPresentationStyle = UIModalPresentationPopover;
    
    self.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    // 设置代理
    self.popoverPresentationController.delegate = self;
    
    if ([self.touchView isKindOfClass:[UIBarButtonItem class]]) {
        self.popoverPresentationController.barButtonItem = (UIBarButtonItem *)self.touchView;
    }
    
    if ([self.touchView isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)self.touchView;
        self.popoverPresentationController.sourceView = view;
        self.popoverPresentationController.sourceRect = view.bounds;
    }
    
    [vc presentViewController:self animated:true completion:completion];
}

- (NSInteger)rows{
    NSInteger count = self.count;
    return count > self.maxRows ? self.maxRows : count;
}

- (NSInteger)count{
    NSInteger imgNum = self.imgs.count;
    NSInteger textNum = self.texts.count;
    return imgNum > textNum ? imgNum : textNum ;
}

- (CGFloat)cellWidth{
    if (_cellWidth == 0.0) {
        return CellWidth;
    } else {
        return _cellWidth;
    }
}

- (CGFloat)cellHeight{
    if (_cellHeight == 0.0) {
        return CellHeight;
    } else {
        return _cellHeight;
    }
}

- (NSInteger)maxRows{
    if (_maxRows == 0.0) {
        return MaxRows;
    }else{
        return _maxRows;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = self.tableView;
    
    self.tableView.separatorInset = self.separatorInset;
    self.tableView.frame = CGRectMake(0.0, 0.0, self.cellWidth, self.rows * self.cellHeight);
    if (self.lineColor) {
        [self.tableView setSeparatorColor:self.lineColor];
    }
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *GYPopverCellId = @"GYPopverCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GYPopverCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GYPopverCellId];
    }
    
    if (indexPath.row < self.imgs.count) {
        cell.imageView.image = [UIImage imageNamed:self.imgs[indexPath.row]];
    }else{
        cell.imageView.image = nil;
    }
    
    if (indexPath.row < self.texts.count) {
        cell.textLabel.text = self.texts[indexPath.row];
    }else{
        cell.textLabel.text = nil;
    }
    
    if (self.textColor) {
        cell.textLabel.textColor = self.textColor;
    }
    
    if (self.font) {
        cell.textLabel.font = self.font;
    }
    
    if (self.cellBackgroundColor) {
        cell.backgroundColor = self.cellBackgroundColor;
    }
    
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.block) {
        [self dismissViewControllerAnimated:true completion:^{
            self.block(indexPath.row);
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.cellHeight;
}

#pragma mark -- UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone; //不适配
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover消失， 默认YES
}

- (void)dealloc{
    GYLog_delloc(self);
}

@end
