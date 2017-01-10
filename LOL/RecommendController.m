//
//  RecommendController.m
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import "RecommendController.h"
#import "RecentUpdateController.h"
#import "GatherController.h"
#import "HotAnchorController.h"
#import "CompetitionController.h"
#import "HSSegmentView.h"
#import "Public.h"

@interface RecommendController ()

@end

@implementation RecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"视频";
   
    //RecentUpdateController *rvc = [[RecentUpdateController alloc] init];
    CompetitionController *cvc = [[CompetitionController alloc] init];
    GatherController *gvc = [[GatherController alloc] init];
    HotAnchorController *hvc = [[HotAnchorController alloc] init];

    
    NSArray *controllers = @[ cvc, gvc, hvc];
    NSArray *titleArray = @[ @"比赛",@"集锦", @"主播"];
    
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
