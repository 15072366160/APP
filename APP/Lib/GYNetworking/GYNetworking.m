//
//  SYHNetworking.m
//  SYHGameSDK
//
//  Created by Paul on 2018/9/27.
//  Copyright © 2018年 Syh. All rights reserved.
//

#import "GYNetworking.h"

#import "AFHTTPSessionManager.h"
#import "GYAPIHeader.h"

static NSString *const AESKEY   = @"xj4kYuqgBsvmUZlI";
static NSString *const SIGNSALT = @"iXPQmHzJDamYJqag";

@implementation GYNetworking


/**
 GET 请求

 @param url api地址
 @param params 请求参数
 @param result 返回结果
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
    [self requestMode:NetModeGET url:url params:params result:result];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
    [self requestMode:NetModePOST url:url params:params result:result];
}

+ (void)hudGetWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
    [GYHUD _show];
    [self requestMode:NetModeGET url:url params:params result:^(BOOL isSuccess, id data, GYAPIError *error) {
        [GYHUD _dismiss];
        result(isSuccess,data,error);
    }];
}

+ (void)hudPostWithURL:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
    [GYHUD _show];
    [self requestMode:NetModePOST url:url params:params result:^(BOOL isSuccess, id data, GYAPIError *error) {
        [GYHUD _dismiss];
        result(isSuccess,data,error);
    }];
}

+ (void)requestMode:(NetMode)mode header:(NSDictionary *)header url:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable data))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    //开始请求数据
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    AFHTTPRequestSerializer *requset = [AFHTTPRequestSerializer serializer];
    requset.stringEncoding = NSUTF8StringEncoding;
    requset.timeoutInterval = 5.0;
    for (NSString *key in header.allKeys) {
        [requset setValue:header[key] forHTTPHeaderField:key];
    }
    manager.requestSerializer = requset;
    
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json",@"text/plain", @"text/javascript", nil];
    manager.responseSerializer = response;
    
    if ([url jk_isContainChinese]) {
        url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }
    GYLog(@"%@", url);
    GYLog(@"%@", params);
    
    if (mode == NetModeGET) {
        [manager GET:url parameters:params progress:nil success:success failure:failure];
    } else {
        [manager POST:url parameters:params progress:nil success:success failure:failure];
    }
}

+ (void)requestMode:(NetMode)mode url:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
#warning 重写请求封装
//    NSDictionary *resultParams = [GYNetworking formatParams:params];
//    NSString *sign = [GYNetworking sign:resultParams];
//    NSString *token = [SYHUserModel user].token;
//    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
//    [headers addValue:token key:@"token"];
//    [headers addValue:sign key:@"sign"];
//
//    //开始请求数据
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//
//    AFHTTPRequestSerializer *requset = [AFHTTPRequestSerializer serializer];
//    requset.stringEncoding = NSUTF8StringEncoding;
//    requset.timeoutInterval = 5.0;
//    manager.requestSerializer = requset;
//
//    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
//    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", @"text/javascript", nil];
//    manager.responseSerializer = response;
//
//    NSString *urlStr = [NetServer stringByAppendingString:url];
//    if ([urlStr jk_isContainChinese]) {
//        urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    }
//    SYHLog(@"%@", urlStr);
//    SYHLog(@"%@", resultParams);
//
//    if (mode == NetModeGET) {
//        [manager GET:urlStr parameters:resultParams headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            [SYHNetworking getResult:responseObject result:result];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            SYHAPIError *err = [SYHAPIError initWithCode:[NSString stringWithFormat:@"%ld",error.code]];
//            err.describe = @"网络异常，请检查网络";
//            result(false,nil,err);
//            SYHLog(@"%@", error);
//        }];
//    } else {
//
//        [manager POST:urlStr parameters:resultParams headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//            [SYHNetworking getResult:responseObject result:result];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            SYHAPIError *err = [SYHAPIError initWithCode:[NSString stringWithFormat:@"%ld",error.code]];
//            err.describe = @"网络异常，请检查网络";
//            result(false,nil,err);
//            SYHLog(@"%@", error);
//        }];
//    }
}

+ (void)getResult:(id)responseObject result:(ResultBlock)result{
    #warning 重写解析封装
//
//    NSDictionary *dict = (NSDictionary *)responseObject;
//
//    NSString *code = [NSString stringWithFormat:@"%@",dict[@"errorCode"]];
//    if ([code isEqualToString:@"0"]) {
//        id data = [self changeType:dict[@"data"]];
//        result(true,data,nil);
//    } else {
//        NSString *message = dict[@"message"];
//        GYAPIError *err = [GYAPIError initWithCode:code];
//        if ([code isEqualToString:@"00000401"]) {
//            // token 失效 重新登录
//            err.describe = @"登录过期,请重新登录";
//            result(false,nil,err);
//        } else if ([code hasPrefix:@"0000050"]){
//            [GYNetworking blacklist:message];
//        } else {
//            if (![message isKindOfClass:[NSNull class]] && message.length > 0) {
//                err.describe = message;
//            }else{
//                err.describe = @"数据解析错误!";
//            }
//            result(false,nil,err);
//        }
//    }
}

+ (void)sendFile:(NSData *)file url:(NSString *)url params:(NSDictionary *)params result:(ResultBlock)result{
    #warning 重写上传文件
//    NSDictionary *resultParams = [GYNetworking formatParams:params];
//    NSString *sign = [GYNetworking sign:resultParams];
//    NSString *token = [SYHUserModel user].token;
//    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
//    [headers addValue:token key:@"token"];
//    [headers addValue:sign key:@"sign"];
//
//    //开始请求数据
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//
//    AFHTTPRequestSerializer *requset = [AFHTTPRequestSerializer serializer];
//    requset.stringEncoding = NSUTF8StringEncoding;
//    requset.timeoutInterval = 5.0;
//    manager.requestSerializer = requset;
//
//    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
//    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", @"text/javascript", nil];
//    manager.responseSerializer = response;
//
//    NSString *urlStr = [NetServer stringByAppendingString:url];
//    if ([urlStr jk_isContainChinese]) {
//        urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    }
//    SYHLog(@"%@", urlStr);
//    SYHLog(@"%@", resultParams);
//
//    [manager POST:urlStr parameters:resultParams headers:headers constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        NSInteger time = [[NSDate date] timeIntervalSince1970] * 1000;
//        NSString *fileName = [NSString stringWithFormat:@"%ld.jpeg",time];
//        [formData appendPartWithFileData:file name:@"image" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [SYHNetworking getResult:responseObject result:result];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        SYHAPIError *err = [SYHAPIError initWithCode:[NSString stringWithFormat:@"%ld",error.code]];
//        err.describe = @"网络异常，请检查网络";
//        result(false,nil,err);
//        SYHLog(@"%@", error);
//    }];
}

//+ (NSDictionary *)formatParams:(NSDictionary *)params{
//    NSMutableDictionary *encryptDict = [NSMutableDictionary dictionary]; // 需要加密的
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary]; // 不需要加密的
//
//    for (NSString *key in params.allKeys) {
//        if ([key hasPrefix:@"__"]) {
//            [encryptDict setObject:params[key] forKey:key];
//        }else{
//            [dict setObject:params[key] forKey:key];
//        }
//    }
//
//    NSString *timestamp = [NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]];
//    [dict setObject:timestamp forKey:@"_timestamp"];
//    if (encryptDict.count > 0) {
//        [dict setObject:[self encryptData:encryptDict] forKey:@"__security"];
//    }else{
////        SYHLog(@"没有需要加密的数据");
//    }
//
//    return dict;
//}

// 加密数据
//+ (NSString *)encryptData:(NSDictionary *)dict{
//
//    if (dict.allKeys.count == 0) {
//        return @"";
//    }
//
//    NSString *iv = [NSString randomStringWithLength:16];
//    NSData *iv_data = [iv dataUsingEncoding:NSUTF8StringEncoding];
//    NSString *iv_Base64 = [iv jk_base64EncodedString];
//
//    NSData *value_data = [dict jk_JSONData];
//    NSData *value_AES_data = [value_data jk_encryptedWithAESUsingKey:AESKEY andIV:iv_data];
//    NSString *value_Base64 = [value_AES_data jk_base64EncodedString];
//
//    NSDictionary *resultDict = @{@"iv":iv_Base64,@"value":value_Base64};
//
//    return [[resultDict jk_JSONData] jk_base64EncodedString];
//}

// 解密数据
//+ (id)decodeData:(NSString *)str{
//    if (str.length == 0) {
//        return nil;
//    }
//
//    NSData *data = [str jk_base64DecodedData];
//    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//
//    NSString *iv_Base64 = resultDict[@"iv"];
//    NSData *iv_data = [iv_Base64 jk_base64DecodedData];
//
//    NSString *value_Base64 = resultDict[@"value"];
//    NSData *value_AES_data = [value_Base64 jk_base64DecodedData];
//    NSData *value_data = [value_AES_data jk_decryptedWithAESUsingKey:AESKEY andIV:iv_data];
//
//    return [NSJSONSerialization JSONObjectWithData:value_data options:NSJSONReadingAllowFragments error:nil];
//}
//
//+ (NSString *)sign:(NSDictionary *)dict{
//    NSInteger count = dict.allKeys.count;
//    if (count == 0) {
//        return @"";
//    }
//    
//    NSArray *keys = [dict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        return [obj1 compare:obj2];
//    }];
//    
//    NSString *sign = @"";
//    for (int i=0; i<count; i++) {
//        NSString *key   = keys[i];
//        NSString *value = dict[key];
//        sign = [sign stringByAppendingFormat:@"%@=%@&",key,value];
//    }
//    sign = [[sign substringToIndex:sign.length - 1] stringByAppendingString:SIGNSALT];
//    return [sign jk_md5String];
//}

#pragma mark - 私有方法

//将NSDictionary中的Null类型的项目转化成@""

+(NSDictionary *)nullDic:(NSDictionary *)myDic{
    
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    
    for (int i = 0; i < keyArr.count; i ++){
        
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self changeType:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

//将NSDictionary中的Null类型的项目转化成@""
+(NSArray *)nullArr:(NSArray *)myArr{
    
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++){
        id obj = myArr[i];
        obj = [self changeType:obj];
        [resArr addObject:obj];
    }
    return resArr;
}

//将NSString类型的原路返回
+(NSString *)stringToString:(NSString *)string{
    return string;
}

//将Null类型的项目转化成@""

+(NSString *)nullToString{
    return @"";
}

#pragma mark - 公有方法

//类型识别:将所有的NSNull类型转化成@""
+(id)changeType:(id)myObj{
    
    if ([myObj isKindOfClass:[NSDictionary class]]){
        
        return [self nullDic:myObj];
    }else if([myObj isKindOfClass:[NSArray class]]){
        
        return [self nullArr:myObj];
    }else if([myObj isKindOfClass:[NSString class]]){
        
        return [self stringToString:myObj];
    }else if([myObj isKindOfClass:[NSNull class]]){
        
        return [self nullToString];
    }else{
        
        return myObj;
    }
}

@end
