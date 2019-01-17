//
//  MaSetVC.m
//  APP
//
//  Created by Paul on 2018/11/30.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaSetVC.h"

@interface MaSetVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *list;

@end

@implementation MaSetVC

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
    
    self.title = @"设置";
    
    self.list = @[@"修改密码",@"找回密码",@"设置密码启动模式",@"输入密钥获取密码"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const MaSetCellID = @"MaSetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MaSetCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MaSetCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: [self changePwd];
            break;
        case 1: [self findPwd];
            break;
        case 2: [self mode];
            break;
        case 3: [self getPwd];
            break;
        default:
            break;
    }
}

- (void)changePwd{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改该视频名称" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入旧密码";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入新密码";
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *text1 = alert.textFields.firstObject.text;
        NSString *text2 = alert.textFields.lastObject.text;
        if (text1.length == 0 || text2.length == 0) {
            [GYHUD _showErrorWithStatus:@"输入不能为空！"];
            return;
        }
        if ([text1 isEqualToString:text2]) {
            [GYHUD _showErrorWithStatus:@"新密码不能与旧密码相同！"];
            return;
        }
        
        [NSUserDefaults addValue:text2 key:APPPassword];
        [GYHUD _showSuccessWithStatus:@"设置成功！"];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self present:alert];
}

- (void)findPwd{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"忘记密码，请联系技术人员，获取密码！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"复制技术微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        [UIPasteboard generalPasteboard].string = @"Paul197309";
        [GYHUD _showSuccessWithStatus:@"复制成功！"];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self present:alert];
}

- (void)mode{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设置密码展示模式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"每次启动应用" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NSUserDefaults addValue:@(AppStarModeLaunching) key:AppStarType];
        [GYHUD _showSuccessWithStatus:@"设置成功!"];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"每次进入应用" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [NSUserDefaults addValue:@(AppStarModeActive) key:AppStarType];
        [GYHUD _showSuccessWithStatus:@"设置成功!"];
    }];
//    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"永不" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [NSUserDefaults addValue:@(AppStarModeNerve) key:AppStarType];
//        [GYHUD _showSuccessWithStatus:@"设置成功!"];
//    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
//    [alert addAction:action3];
    [alert addAction:action4];
    [self present:alert];
}

- (void)getPwd{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入从技术人员获取的密钥来获取密码" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密钥";
        textField.keyboardType = UIKeyboardTypeASCIICapable;
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *text = alert.textFields.firstObject.text;
        if (text.length == 0) {
            [GYHUD _showErrorWithStatus:@"密钥不能为空!"];
            return ;
        }
        
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyyMMdd";
        NSString *timeStr = [NSString stringWithFormat:@"Paul%@",[fmt stringFromDate:[NSDate date]]];
        NSString *key = [timeStr jk_md5String];
        // 1e74aa6388c9f5ecfc8b6bd70ecab901
        // a0fa0d352b97e2cd33e49cb5bd1ddac5
        if ([text isEqualToString:key]) {
            [UIPasteboard generalPasteboard].string = [NSUserDefaults objectForKey:APPPassword];
            [GYHUD _showSuccessWithStatus:@"获取密码成功，已经复制到剪切板！"];
        }else{
            [GYHUD _showErrorWithStatus:@"密钥错误!"];;
        }
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self present:alert];
}

@end
