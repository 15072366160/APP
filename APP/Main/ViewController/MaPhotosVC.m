//
//  MaPhotosVC.m
//  APP
//
//  Created by Paul on 2018/11/29.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaPhotosVC.h"
#import "MaPhotosItem.h"
#import "MaPhotosModel.h"

@interface MaPhotosVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,copy) NSArray <MaPhotosModel *>*list;

@property (nonatomic,strong) UIImagePickerController *picker;

@property (nonatomic,strong) UIBarButtonItem *rightItem1;

@end

@implementation MaPhotosVC

- (UIImagePickerController *)picker{
    if (_picker == nil) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.allowsEditing = false;
        _picker.title = @"相册";
        _picker.delegate = self;
        
        UIImage *img = [UIImage imageGradualOblique:HEX_COLOR(@"#02AAB0") endColor:HEX_COLOR(@"#00CDAC") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
        [_picker.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
        _picker.navigationBar.barStyle = UIBarStyleBlack;
        _picker.navigationBar.tintColor = WHITE_COLOR;
    }
    return _picker;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        
        CGFloat space = 2;
        CGFloat left = 3;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = space;
        layout.minimumInteritemSpacing = space;
        layout.sectionInset = UIEdgeInsetsMake(left, left, left, left);
        CGFloat w = (SCREEN_WIDTH - left * 2 - space * 2) / 3;
        layout.itemSize = CGSizeMake(w, w * 1.3);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = BACKGROUND_COLOR;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"相册";
    
//    [self addLeftItemWithObj:[UIImage imageNamed:@"箭头"]];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.collectionView registerWithClassName:MaPhotosItemId];
    
    [self.collectionView addHeaderTarget:self Action:@selector(reloadData)];
    [self reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:NotiInsertPhotoFromOtherApp object:nil];
    
    self.rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(rightItme1:)];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(rightItme2:)];
    self.navigationItem.rightBarButtonItems = @[rightItem2,self.rightItem1];
    
    
    UIBarButtonItem *toolBarItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(toolBarItem:)];
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:@[item0,toolBarItem,item0]];
//    self.navigationController.toolbar.barTintColor = HEX_COLOR(@"02AAB0");
    self.navigationController.toolbar.tintColor = WHITE_COLOR;
    
    UIImage *img = [UIImage imageGradualOblique:HEX_COLOR(@"#02AAB0") endColor:HEX_COLOR(@"#00CDAC") size:CGSizeMake(SCREEN_WIDTH, [GYScreen shared].navBarH)];
    [self.navigationController.toolbar setBackgroundImage:img forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setToolbarHidden:true animated:animated];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotiInsertPhotoFromOtherApp object:nil];
}

- (void)rightItme1:(UIBarButtonItem *)rightItem{
    [self.navigationController setToolbarHidden:rightItem.tag animated:true];
    rightItem.tag = rightItem.tag == 0? 1 : 0;
    self.rightItem1.title = rightItem.tag == 0? @"编辑" : @"取消";
    [self.collectionView reloadData];
}

- (void)rightItme2:(UIBarButtonItem *)rightItem{
    [self present:self.picker];
    
    if (self.rightItem1.tag == 1) {
        [self rightItme1:self.rightItem1];
    }
}

- (void)toolBarItem:(UIBarButtonItem *)item{
    
//    NSMutableArray *mArr = [self.list mutableCopy];
    NSMutableArray *mArr = [NSMutableArray array];
    NSMutableArray *deletedArr = [NSMutableArray array];
    for (MaPhotosModel *model in self.list) {
        if (model.isSeleted == true) {
            [deletedArr addObject:model];
        }else{
            [mArr addObject:model];
        }
    }
    
    if (deletedArr.count == 0) {
        [GYHUD _showInfoWithStatus:@"未选中照片！"];
        return;
    }
    
    self.list = mArr;
    
    [UIAlertController alert:@"是否删除选中照片？" sure:^(UIAlertAction *action) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            for (MaPhotosModel *model in deletedArr) {
                BOOL isDeleted = [FMDBManager deletedData:PhotoListTable key:PhotoID value:@(model.sid)];
                if (isDeleted) {
                    NSFileManager *fileManager = [NSFileManager defaultManager];
                    NSError *error;
                    BOOL isFMDeleted = [fileManager removeItemAtPath:model.path error:&error];
                    if (isFMDeleted == false) {
                        GYLog(@"视频资源删除失败！error：%@",error);
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        });
        
    } canle:nil];
}

- (void)reloadData{
    NSArray *arr = [FMDBManager selectedData:PhotoListTable fieldKyes:@[PhotoID,PhotoName,PhotoPath,PhotoTime]];
    self.list = [[[MaPhotosModel mj_objectArrayWithKeyValuesArray:arr] reverseObjectEnumerator] allObjects];
    [self.collectionView reloadData];
    
    if ([self.collectionView.mj_header isRefreshing]) {
        [self.collectionView.mj_header endRefreshing];
    }
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MaPhotosItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:MaPhotosItemId forIndexPath:indexPath];
    MaPhotosModel *model = self.list[indexPath.row];
    item.model = model;
    item.btn.hidden = !self.rightItem1.tag;
    return item;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (self.rightItem1.tag == 0) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (int i = 0; i < self.list.count; i++) {
            MaPhotosItem *cell = (MaPhotosItem *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            MaPhotosModel *model = self.list[i];
            KSPhotoItem *item = [KSPhotoItem itemWithSourceView:cell.imgView imageUrl:[NSURL fileURLWithPath:model.path]];
            [items addObject:item];
        }
        
        KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:indexPath.row];
        browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleScale;
        browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlack;
        browser.loadingStyle = KSPhotoBrowserImageLoadingStyleIndeterminate;
        browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleText;
        [browser showFromViewController:self];
    }else{
        MaPhotosModel *model = self.list[indexPath.row];
        MaPhotosItem *item = (MaPhotosItem *)[collectionView cellForItemAtIndexPath:indexPath];
        item.btn.selected = !item.btn.selected;
        model.isSeleted = item.btn.selected;
    }
}

#pragma mark -- UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [self.picker dismiss];
    
    if (@available(iOS 11.0, *)) {
        NSURL *url = info[UIImagePickerControllerImageURL];
        [[NSNotificationCenter defaultCenter] postNotificationName:NotiSavePhotoToLocationApp object:nil userInfo:@{PhotoUrl:url}];
    } else {
        // Fallback on earlier versions
    }
}

@end
