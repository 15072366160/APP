//
//  MaVideoModel.m
//  APP
//
//  Created by Paul on 2018/11/28.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaVideoModel.h"

@implementation MaVideoModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sid":@"id",@"name":VideoName,@"path":VideoPath,@"time":VideoTime,@"duration":VideoDuration};
}

@end
