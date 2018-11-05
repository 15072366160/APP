//
//  SYHNetworking.h
//  SYHGameSDK
//
//  Created by Paul on 2018/9/27.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GYAPIError.h"

typedef void(^ResultBlock)(BOOL isSuccess, id data, GYAPIError *error);

typedef NS_ENUM(NSUInteger) {
    NetModeGET,
    NetModePOST,
}NetMode;

@interface GYNetworking : NSObject


/**
 一般请求
 @param mode 请求方式 GET POST
 @param url 请求链接
 @param params 请求参数
 @param success 请求成功
 @param failure 请求失败
 */
+ (void)requestMode:(NetMode)mode header:(NSDictionary *)header url:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable data))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/**
 GET 请求
 
 @param url api地址
 @param params 请求参数
 @param result 返回结果
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result;

/**
 POST 请求
 
 @param url api地址
 @param params 请求参数
 @param result 返回结果
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result;

/**
 GET 请求
 
 @param url api地址
 @param params 请求参数
 @param result 返回结果
 */
+ (void)hudGetWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result;

/**
 POST 请求
 
 @param url api地址
 @param params 请求参数
 @param result 返回结果
 */
+ (void)hudPostWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result;

// 解密数据
+ (id)decodeData:(NSString *)str;

// 结果返回
+ (void)getResult:(id)responseObject result:(ResultBlock)result;


/**
 发送文件
 @param file 二进制文件
 @param url 链接
 @param params 请求参数
 @param result 返回结果
 */
+ (void)sendFile:(NSData *)file url:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result;

@end
