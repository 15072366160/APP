//
//  HeaderConst.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderConst_h
#define HeaderConst_h

// Mob注册
static NSString  *const SMSRegiestCode           = @"2268951";
// Mob找回密码
static NSString  *const SMSFindCode              = @"2268950";
// Mob重置密码
static NSString  *const SMSResetCode             = @"832481";
// Mob设置支付密码
static NSString  *const SMSPaySetCode            = @"5853118";
// Mob修改支付密码
static NSString  *const SMSPayUpdateCode         = @"5853119";

static NSString  *const AppUrl                   = @"http://www.wanglianlife.com/iahy/index.html";
static NSString  *const AppUrl_Share             = @"www.wanglianlife.com/iahy/index.html";

// 前往App Store
static NSString *const AppStore_Open             = @"itms-apps://itunes.apple.com/app/id";

static NSString  *const APPID                    = @"1352251673";

// APP Store的信息
static NSString *const AppStore_AppInfo          = @"http://itunes.apple.com/lookup?id=";



// 文字常量
static NSString  *const BackIMG_White             = @"icon_返回";
static NSString  *const BackIMG_Gray              = @"icon_返回_灰色";
static NSString  *const BackIMG_X                 = @"back";
static NSString  *const Icon_more                 = @"my_more";
static NSString  *const Default_Icon              = @"默认头像";
static NSString  *const Default_100x100           = @"默认100x100";
static NSString  *const Default_375x100           = @"默认375x100";
static NSString  *const Default_375x375           = @"默认375x375";

static NSString  *const GYTableView               = @"GYTableView";

//  常量
static NSString  *const LoginPhone                 = @"LoginPhone";
static NSString  *const LoginPwd                   = @"LoginPwd";

static NSString  *const DefaultCity                = @"DefaultCity";

// 二维码前缀 后缀
static NSString  *const QRCodePrefix               = @"WLSH";
static NSString  *const QRCodeSuffix               = @"1227";

// 通知
// 用户照片修改通知
static NSString  *const NotificationUserImgChange  = @"NotificationUserImgChange";
// 成为商家
static NSString  *const NotificationBecomeSeller   = @"NotificationBecomeSeller";
// 实名认证
static NSString  *const NotificationAuth           = @"NotificationAuth";
// 刷新个人圈
static NSString  *const NotificationRefreshPerson  = @"NotificationRefreshPerson";
// 刷新商圈
static NSString  *const NotificationRefreshSeller  = @"NotificationRefreshSeller";
// 操作动态
static NSString  *const NotificationOperation      = @"NotificationOperation";
// 二维码扫描
static NSString  *const NotificationScanQRCode     = @"NotificationScanQRCode";
// 是否可以刷新红包
static NSString  *const NotificationIsRefreshTask  = @"NotificationIsRefreshTask";
// 刷新红包
static NSString  *const NotificationReFreshTaskMap = @"NotificationReFreshTaskMap";
// 刷新网圈
static NSString  *const NotificationReFreshQuan    = @"NotificationReFreshQuan";
// 刷新商铺数据
static NSString  *const NotificationMyShop         = @"NotificationMyShop";

// 第一次进APP
static NSString  *const IsFirstLoginApp            = @"IsFirstLoginApp";

// 第一次进首页
static NSString  *const IsFirstComeMain            = @"IsFirstComeMain";


#endif /* HeaderConst_h */
