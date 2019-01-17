//
//  MaPhotosModel.m
//  APP
//
//  Created by Paul on 2018/11/29.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "MaPhotosModel.h"

@implementation MaPhotosModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"sid":@"id",@"name":PhotoID,@"path":PhotoPath,@"time":PhotoTime};
}

@end
