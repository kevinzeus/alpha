//
//  ZixunViewController.m
//  LOL
//
//  Created by kevinzeus on 2016/12/18.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "ZixunViewController.h"

@interface ZixunViewController ()

@end

@implementation ZixunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资讯";
    self.view.backgroundColor = [UIColor clearColor];
    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.frame];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lolapp.duowan.com/index.php?r=news/index&menu=%E9%87%8D%E7%82%B9"]]];
    [self.view addSubview:view];
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
