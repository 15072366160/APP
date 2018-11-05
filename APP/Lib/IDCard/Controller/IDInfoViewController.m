//
//  IDInfoViewController.m
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/2/21.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import "IDInfoViewController.h"
#import "IDInfo.h"
#import "AVCaptureViewController.h"

@interface IDInfoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *IDImageView;

@property (strong, nonatomic) IBOutlet UILabel *IDNumName;

@property (strong, nonatomic) IBOutlet UILabel *IDNumLabel;

@end

@implementation IDInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"身份证信息";
    
    self.IDImageView.layer.cornerRadius = 8;
    self.IDImageView.layer.masksToBounds = YES;
    
    self.IDNumLabel.text = _IDInfo.num;
    self.IDImageView.image = _IDImage;
    
    self.IDNumName.text = _IDInfo.name;
    
    [self addLeftItemWithObj:[UIImage imageNamed:@""]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 错误，重新拍摄
- (IBAction)shootAgain:(UIButton *)sender {    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 正确，下一步
- (IBAction)nextStep:(UIButton *)sender {
    
//    WEAKSELF;
#warning 认证
//    [Networking updataUserInfoWithNick:nil sign:nil sex:nil birthday:nil realName:self.IDInfo.name cardNum:self.IDInfo.num citycode:nil adcode:nil cityName:nil center:nil cityType:nil skill:nil userIcon:nil cardFront:nil cardCon:nil hand:nil qq:nil weixin:nil weibo:nil result:^(id data, GYError *error, BOOL isSuccess) {
//        if (isSuccess) {
//            [GY_HUD _showSuccessWithStatus:@"认证成功！"];
//            UserModel *user = [UserModel getUser];
//            user.attest = 1;
//            [UserModel saveUser:user];
//
//            UIViewController *infoVC = nil;
//            for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
//                if (vc.view.tag == 9527) {
//                    infoVC = vc;
//                }
//            }
//
//            if (infoVC == nil) {
//                infoVC = weakSelf.navigationController.viewControllers[1];
//            }
//
//            [weakSelf.navigationController popToViewController:infoVC animated:true];
//        } else {
//            [GY_HUD checkError:error];
//        }
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationAVCaptureViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
