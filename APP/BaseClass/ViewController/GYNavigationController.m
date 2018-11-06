//
//  GYNvigationController.m
//  APP
//
//  Created by Paul on 2018/11/6.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYNavigationController.h"


@interface GYNVC : UINavigationController

@property (nonatomic ,assign) CGRect frame;

@end

@implementation GYNVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController frame:(CGRect)frame{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
        self.frame = frame;
    }
    return self;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.view.frame = self.frame;
}

@end



@interface GYNavigationController ()

@property (nonatomic,strong) GYNVC *nvc;

@end

@implementation GYNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController option:(GYOptionsMode)option frame:(CGRect)frame{
    
    self = [super initWithOptions:option];
    if (self) {
        
        self.nvc = [[GYNVC alloc] initWithRootViewController:rootViewController frame:frame];
        
        [self addChildViewController:self.nvc];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
