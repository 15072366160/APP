//
//  ViewController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MainVC.h"

#import "ZFPlayer.h"

#import "MaVideoModel.h"
#import "MaVideoCell.h"

#import "MaLocationVC.h"
#import "MaPhotosVC.h"


#import <MobileCoreServices/MobileCoreServices.h>

#import "BaNavigationController.h"

@interface MainVC () <UITableViewDelegate,UITableViewDataSource,ZFPlayerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,copy) NSArray <MaVideoModel *>*list;

//视频播放
@property (nonatomic, strong) ZFPlayerView        *playerView;
@property (nonatomic, strong) ZFPlayerControlView *controlView;

@property (nonatomic,strong) UIImagePickerController *picker;

@end

@implementation MainVC

- (UIImagePickerController *)picker{
    if (_picker == nil) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.allowsEditing = false;
        _picker.title = @"选择视频";
        _picker.delegate = self;
        _picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeMovie, (NSString*)kUTTypeVideo, nil];
        
        UIImage *img = [UIImage imageGradualOblique:HEX_COLOR(@"#02AAB0") endColor:HEX_COLOR(@"#00CDAC") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
        [_picker.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        _picker.navigationBar.barStyle = UIBarStyleBlack;
        _picker.navigationBar.tintColor = WHITE_COLOR;
    }
    return _picker;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorColor = LINE_COLOR_1;
        _tableView.backgroundColor = BACKGROUND_COLOR;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频资源";
    
    [self addRightItemWithObj:@"添加本地视频"];
    [self addLeftItemWithObj:@"相册"];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerWithClassName:MaVideoCellId];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    // 添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:NotiInsertVideoFromOtherApp object:nil];
    
    [self.tableView addHeaderTarget:self Action:@selector(reloadData)];
    
    [self reloadData];
    
}

- (void)leftItem:(UIBarButtonItem *)leftItem{
    MaPhotosVC *vc = [[MaPhotosVC alloc] init];
    [self push:vc];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotiInsertVideoFromOtherApp object:nil];
}

- (void)reloadData{
    NSArray *arr = [FMDBManager selectedData:VideoListTable fieldKyes:@[VideoID,VideoName,VideoPath,VideoTime,VideoDuration]];
    self.list = [[[MaVideoModel mj_objectArrayWithKeyValuesArray:arr] reverseObjectEnumerator] allObjects];
    [self.tableView reloadData];
    
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
}

- (void)rightItme:(UIBarButtonItem *)rightItem{
    [self present:self.picker];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MaVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:MaVideoCellId forIndexPath:indexPath];
    if (indexPath.row < self.list.count) {
        // 取到对应cell的model
        __block MaVideoModel *model = self.list[indexPath.row];
        // 赋值model
        cell.model                         = model;
        __block NSIndexPath *weakIndexPath = indexPath;
        __block MaVideoCell *weakCell      = cell;
        __weak typeof(self)  weakSelf      = self;
        // 点击播放的回调
        cell.playBlock = ^(UIButton *btn){
            ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
            playerModel.title            = model.name;
            playerModel.videoURL         = [NSURL fileURLWithPath:model.path];
            // playerModel.placeholderImageURLString = model.vedio_img;
            playerModel.scrollView       = weakSelf.tableView;
            playerModel.indexPath        = weakIndexPath;
            // player的父视图tag
            playerModel.fatherViewTag    = weakCell.imgView.tag;
            // 设置播放控制层和model
            [weakSelf.playerView playerControlView:nil playerModel:playerModel];
            // 自动播放
            [weakSelf.playerView autoPlayTheVideo];
            
            model.time = [[NSDate date] timeIntervalSince1970];
            [FMDBManager updateData:VideoListTable filedDict:@{VideoTime:@(model.time)} key:VideoID value:@(model.sid)];
        };
        
        cell.block = ^(UILabel *label) {
            [weakSelf updateNameWithLabel:label];
        };
    }
    cell.label.tag = indexPath.row + 100;
    cell.imgView.tag = indexPath.row + 1000;
    return cell;
}

- (void)updateNameWithLabel:(UILabel *)label{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改该视频名称" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入名称";
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textField = alert.textFields.firstObject;
        NSString *name = textField.text;
        NSInteger index = label.tag - 100;
        MaVideoModel *model = self.list[index];
        model.name = name;
        label.text = name;
        [FMDBManager updateData:VideoListTable filedDict:@{VideoName:name} key:VideoID value:@(model.sid)];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self present:alert];
}

#pragma mark -- UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark -- 处理视频
// 页面消失时候
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.playerView resetPlayer];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    // 这里设置横竖屏不同颜色的statusbar
    if (ZFPlayerShared.isLandscape) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return ZFPlayerShared.isStatusBarHidden;
}

- (ZFPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        _playerView.hasDownload = false;
        // 当cell划出屏幕的时候停止播放
//         _playerView.stopPlayWhileCellNotVisable = YES;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        // _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 静音
        // _playerView.mute = YES;
    }
    return _playerView;
}

- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [[ZFPlayerControlView alloc] init];
    }
    return _controlView;
}


#pragma mark - ZFPlayerDelegate
- (void)zf_playerDownload:(NSString *)url {
    // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
    //    NSString *name = [url lastPathComponent];
    //    [[ZFDownloadManager sharedDownloadManager] downFileUrl:url filename:name fileimage:nil];
    //    // 设置最多同时下载个数（默认是3）
    //    [ZFDownloadManager sharedDownloadManager].maxCount = 4;
}

#pragma mark -- UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [self.picker dismiss];
    
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if([mediaType isEqualToString:(NSString*)kUTTypeMovie] || [mediaType isEqualToString:(NSString*)kUTTypeVideo]){
        
        NSURL *url = info[UIImagePickerControllerMediaURL];
        [[NSNotificationCenter defaultCenter] postNotificationName:NotiSaveVideoToLocationApp object:nil userInfo:@{VideoUrl:url}];
    }
}

#pragma mark - 删除数据
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return false;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row < self.list.count) {
        
        MaVideoModel *model = self.list[indexPath.row];
        BOOL isDeleted = [FMDBManager deletedData:VideoListTable key:VideoID value:@(model.sid)];
        if (isDeleted) {
            [self reloadData];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSError *error;
            BOOL isFMDeleted = [fileManager removeItemAtPath:model.path error:&error];
            if (isFMDeleted == false) {
                GYLog(@"视频资源删除失败！error：%@",error);
            }
        }
    }
}


@end
