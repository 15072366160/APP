//
//  BaTabBarController.m
//  APP
//
//  Created by Paul on 2018/11/2.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "BaTabBarController.h"
#import "BaNavigationController.h"
#import "BaRootViewController.h"

@interface BaTabBarController ()

@end

@implementation BaTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *classNames = @[@"MainVC",@"MainVC",@"MainVC",@"MainVC"];
    
    NSArray *selectedImageName = @[@"MainVC",@"MainVC",@"MainVC",@"MainVC"];
    NSArray *normalImageName = @[@"MainVC",@"MainVC",@"MainVC",@"MainVC"];
    
    NSArray *titles = @[@"MainVC",@"MainVC",@"MainVC",@"MainVC"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (int i=0; i<classNames.count; i++) {
        Class class = NSClassFromString(classNames[i]);
        BaRootViewController *vc = [[class alloc] init];
        
        UIImage *selectedImage = [[UIImage imageNamed:selectedImageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *normalImage = [[UIImage imageNamed:normalImageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectedImage];
        vc.title = titles[i];
        
        BaNavigationController *nvc = [[BaNavigationController alloc] initWithRootViewController:vc];
        [viewControllers addObject:nvc];
    }
    
    self.viewControllers = viewControllers;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
