//
//  MaLocationVC.m
//  APP
//
//  Created by Paul on 2018/11/28.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaLocationVC.h"

#import "MaVideoModel.h"

@interface MaLocationVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *list;

@end

@implementation MaLocationVC

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = LINE_COLOR_1;
        _tableView.backgroundColor = BACKGROUND_COLOR;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"获取本地资源";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self addLeftItemWithObj:[UIImage imageNamed:@"箭头"]];
    [self addRightItemWithObj:[UIImage imageNamed:@"加载"]];
    
    [self.tableView addHeaderTarget:self Action:@selector(reloadData)];
}

- (void)reloadData{
    NSArray *arr = [FMDBManager selectedData:VideoListTable fieldKyes:@[VideoID,VideoName,VideoPath,VideoTime,VideoDuration]];
    self.list = [[[MaVideoModel mj_objectArrayWithKeyValuesArray:arr] reverseObjectEnumerator] allObjects];
    [self.tableView reloadData];
    
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const MaLocationCellId = @"MaLocationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MaLocationCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MaLocationCellId];
    }
    MaVideoModel *model = self.list[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld、%@",indexPath.row + 1,model.name];
    return cell;
}

@end
