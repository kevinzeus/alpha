//
//  BaseTabBarController.m
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HeroController.h"
#import "RecommendController.h"
#import "MineController.h"
#import "BaseNaviController.h"
#import "Public.h"
#import "ZixunViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.opaque = YES;
    self.tabBar.tintColor = TabBar_T_Color;
    [self initChildViewControllers];
}

- (void)initChildViewControllers {
    
    NSMutableArray *childArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    ZixunViewController *zixunVC = [[ZixunViewController alloc] init];
    [zixunVC.tabBarItem setTitle:@"资讯"];
    [zixunVC.tabBarItem setImage:[UIImage imageNamed:@"2"]];
    [zixunVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"1"]];
    BaseNaviController *navizixunVC = [[BaseNaviController alloc] initWithRootViewController:zixunVC];
    [childArray addObject:navizixunVC];
    
    HeroController *heroVC = [[HeroController alloc] init];
    [heroVC.tabBarItem setTitle:@"英雄"];
    [heroVC.tabBarItem setImage:[UIImage imageNamed:@"2"]];
    [heroVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"1"]];
    BaseNaviController *naviHeroVC = [[BaseNaviController alloc] initWithRootViewController:heroVC];
    [childArray addObject:naviHeroVC];
    
    RecommendController *recommendVC = [[RecommendController alloc] init];
    [recommendVC.tabBarItem setTitle:@"视频"];
    [recommendVC.tabBarItem setImage:[UIImage imageNamed:@"2"]];
    [recommendVC.tabBarItem setSelectedImage:[UIImage imageNamed: @"1"]];
    BaseNaviController *naviRecommendVC = [[BaseNaviController alloc] initWithRootViewController:recommendVC];
    [childArray addObject:naviRecommendVC];
    
    
    
    MineController *mineVC = [[MineController alloc] init];
    [mineVC.tabBarItem setTitle:@"我的"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"2"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"1"]];
   
    BaseNaviController *naviMineVC = [[BaseNaviController alloc] initWithRootViewController:mineVC];
    [childArray addObject:naviMineVC];
    
    
    [self setViewControllers:childArray];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
