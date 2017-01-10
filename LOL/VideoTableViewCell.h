//
//  VideoTableViewCell.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
#import "HistoryModel.h"

@interface VideoTableViewCell : UITableViewCell

@property (nonatomic, strong) VideoModel *videoModel;
@property (nonatomic, strong) HistoryModel *historyModel;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;
@end
