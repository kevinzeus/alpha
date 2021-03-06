//
//  RecentUpdateController.m
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import "RecentUpdateController.h"
#import "VideoPlayViewController.h"
#import "VideoTableViewCell.h"
#import "NetworkSingleton.h"
#import "HeroSingleton.h"
#import "MJExtension.h"
#import "FMDBManager.h"
#import "VideoModel.h"
#import "MJRefresh.h"
#import "ZXVideo.h"
#import "Public.h"
#import "URL.h"

@interface RecentUpdateController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation RecentUpdateController {

    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int times; // 记录上拉次数
    NSIndexPath *_index;

}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    [_tableView deselectRowAtIndexPath:_index animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    times = 1;
    [self initTableView];
    [self loadMoreData];
}


- (void)loadMoreData {
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSString *time = [NSString stringWithFormat:@"%d",times];

        [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@%@%@",RecentRUL_1, time, RecentRUL_2] parameters:nil success:^(id responseObject) {
            
            NSDictionary *rootDic2 = [responseObject objectForKey:@"Data"];
            NSArray *array = [rootDic2 objectForKey:@"Result"];
            _dataArray = [VideoModel objectArrayWithKeyValuesArray:array];

            [_tableView reloadData];
            [_tableView.header endRefreshing];
            
        } failure:^(NSError *error) {
            
            [_tableView.header endRefreshing];
            
        }];

    }];
    
    [_tableView.header beginRefreshing];
    
    
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        times += 1;
        NSString *time = [NSString stringWithFormat:@"%d",times];

        dispatch_queue_t queue = dispatch_get_main_queue();
        
        dispatch_async(queue, ^{

            [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@%@%@",RecentRUL_1, time, RecentRUL_2] parameters:nil success:^(id responseObject) {
                
                NSDictionary *rootDic2 = [responseObject objectForKey:@"Data"];
                NSArray *array = [rootDic2 objectForKey:@"Result"];

                NSArray * videoArray = [VideoModel objectArrayWithKeyValuesArray:array];

                for (VideoModel *videoModel in videoArray) {

                    [_dataArray addObject:videoModel];
                }


                [_tableView reloadData];
                [_tableView.footer endRefreshing];

                if (videoArray.count == 0) {
                    [_tableView.footer endRefreshingWithNoMoreData];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        _tableView.footer.hidden = YES;
                    });
                    
                }

                
            } failure:^(NSError *error) {
                
                [_tableView.header endRefreshing];
                
            }];

            
        });
        
        
    }];
    
}


- (void)initTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.rowHeight = 110 * KWidth_ScaleW;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight ;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 5, 0, 5);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoTableViewCell *cell = [VideoTableViewCell loadCellWithTableView:tableView];
    
    cell.videoModel = _dataArray[indexPath.item];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
    
}

// 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _index = [tableView indexPathForSelectedRow];

    ZXVideo *video = [[ZXVideo alloc] init];
    VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
    
    VideoModel *model = _dataArray[indexPath.row];
    NSDictionary *dic = [[NSDictionary alloc]init];
    
    
    // 找出 dic[@"Key"]
    for(dic in model.F) {
        
        break;
    }
 
        [[NetworkSingleton sharedManager] GET:[NSString stringWithFormat:@"%@%@%@%@",PlayURL_1, model.I, PlayURL_2, dic[@"Key"]] parameters:nil success:^(id responseObject) {
            
            NSArray *array = [responseObject objectForKey:@"Data"];
            NSDictionary *dic = [[NSDictionary alloc] init];
            for (dic in array) {

                video.playUrl = dic[@"Url"];
                break;
            }

            video.title = model.T;
            vc.video = video;
            vc.hidesBottomBarWhenPushed = YES;
            
            
            // 数据录入
            [[FMDBManager shareInstance] insertIntoWithName:model.P titleS:model.T dateS:model.A countS:model.V videoURL:dic[@"Url"]];
            
            [self.navigationController pushViewController:vc animated:YES];
        } failure:^(NSError *error) {
                        
        }];
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
