//
//  MaPhotosModel.h
//  APP
//
//  Created by Paul on 2018/11/29.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MaPhotosModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *path;

@property (nonatomic,assign) NSInteger sid;
@property (nonatomic,assign) NSInteger time;

@property (nonatomic,assign) BOOL isSeleted;

@end

NS_ASSUME_NONNULL_END
