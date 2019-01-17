//
//  HeaderConst.h
//  Mjb
//
//  Created by Paul197309 on 2017/10/26.
//  Copyright © 2017年 ssc. All rights reserved.
//

#ifndef HeaderConst_h
#define HeaderConst_h

static NSString  *const BackIMG_Gray            = @"BackIMG_Gray";

// 数据库
static NSString *const VideoListTable     = @"VideoListTable"; // 视频表
static NSString *const VideoID            = @"id";
static NSString *const VideoName          = @"VideoName";
static NSString *const VideoPath          = @"VideoPath";
static NSString *const VideoTime          = @"VideoTime";
static NSString *const VideoDuration      = @"VideoDuration";

static NSString *const PhotoListTable     = @"PhotoListTable"; // 相册
static NSString *const PhotoID            = @"id";
static NSString *const PhotoName          = @"PhotoName";
static NSString *const PhotoPath          = @"PhotoPath";
static NSString *const PhotoTime          = @"PhotoTime";

// 通知
static NSString *const NotiInsertVideoFromOtherApp    = @"NotiInsertVideoFromOtherApp"; // 添加视频
static NSString *const NotiSaveVideoToLocationApp     = @"NotiSaveVideoToLocationApp"; // 添加视频到本APP

static NSString *const VideoUrlString     = @"VideoUrlString"; // 视频 UrlString
static NSString *const VideoUrl           = @"VideoUrl"; // 视频URL

static NSString *const NotiInsertPhotoFromOtherApp    = @"NotiInsertPhotoFromOtherApp"; // 添加照片
static NSString *const NotiSavePhotoToLocationApp     = @"NotiSavePhotoToLocationApp"; // 添加照片到本APP
static NSString *const PhotoUrl                       = @"PhotoUrl"; // 照片URL

// 是否第一次启动APP
static NSString *const APPIsFirst                     = @"APPIsFirst";
// 密码
static NSString *const APPPassword                    = @"APPPassword";
// 密码模式
static NSString *const AppStarType                    = @"AppStarType";


#endif /* HeaderConst_h */
