//
//  HeroController.m
//  LOL
//
//  Created by Kean on 16/7/2.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HeroController.h"
#import "HSSegmentView.h"
#import "AllHeroController.h"
#import "FreeHeroController.h"
#import "Public.h"

@interface HeroController ()

@end

@implementation HeroController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"英雄";
    AllHeroController *allHero = [[AllHeroController alloc] init];
    FreeHeroController *freeHero = [[FreeHeroController alloc] init];
    NSArray *controllers = @[allHero];
    NSArray *titleArray = @[@"英雄视频"];
    HSSegmentView *hss = [[HSSegmentView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height - 64) buttonName:titleArray contrllers:controllers parentController:self];
    
    [self.view addSubview:hss];
    
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
