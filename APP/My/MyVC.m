//
//  MyVC.m
//  APP
//
//  Created by Paul on 2018/11/5.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MyVC.h"
#import "MaSetVC.h"

@interface MyVC ()<UITextFieldDelegate>

@property (nonatomic,strong) UIVisualEffectView *bkView; // 毛玻璃

@property (nonatomic,strong) UITextField *textField; // 毛玻璃

@end

@implementation MyVC

- (UIVisualEffectView *)bkView{
    if (_bkView == nil) {
        /*
         毛玻璃的样式(枚举)
         UIBlurEffectStyleExtraLight,
         UIBlurEffectStyleLight,
         UIBlurEffectStyleDark
         */
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        _bkView = [[UIVisualEffectView alloc] initWithEffect:effect];
        _bkView.frame = self.view.bounds;
    }
    return _bkView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
    [self.navigationController setNavigationBarHidden:true animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:false animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backimg"]];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bkView];
    
    BOOL isFirst = [[NSUserDefaults objectForKey:APPIsFirst] boolValue];
    NSString *text;
    if (isFirst) {
        text = @"请输入密码解锁";
    }else{
        text = @"请设置密码";
    }
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT / 4, SCREEN_WIDTH, 50)];
    self.textField.placeholder = text;
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.textAlignment = NSTextAlignmentCenter;
    [self.textField setValue:WHITE_COLOR forKeyPath:@"_placeholderLabel.textColor"];
    self.textField.secureTextEntry = true;
    self.textField.font = FONT_BOLD(30);
    self.textField.textColor = WHITE_COLOR;
    self.textField.tintColor = WHITE_COLOR;
    self.textField.delegate = self;
//    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:self.textField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"设置" forState:0];
    [btn setTitleColor:WHITE_COLOR forState:0];
    btn.titleLabel.font = FONT_16;
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo([GYScreen shared].navStatusH);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(70);
        make.right.mas_equalTo(0);
    }];
}

- (void)btnAction{
    MaSetVC *vc = [[MaSetVC alloc] init];
    [self push:vc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    if (self.textField.text.length == 0) {
        [GYHUD _showErrorWithStatus:@"输入不能为空!"];
        return true;
    }
    
    BOOL isFirst = [[NSUserDefaults objectForKey:APPIsFirst] boolValue];
    if (isFirst) {
        // 校验密码
        if ([self.textField.text isEqualToString:[NSUserDefaults objectForKey:APPPassword]]) {
            [self dismiss];
        } else {
            [GYHUD _showErrorWithStatus:@"密码错误!"];
        }
    } else {
        [NSUserDefaults addValue:self.textField.text key:APPPassword];
        [GYHUD _showSuccessWithStatus:@"密码设置成功!"];
        [NSUserDefaults addValue:@(1) key:APPIsFirst];
        [self dismiss];
    }
    
    return true;
}

@end
