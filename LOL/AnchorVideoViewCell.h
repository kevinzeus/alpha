//
//  AnchorVideoViewCell.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface AnchorVideoViewCell : UITableViewCell

@property (nonatomic, strong) VideoModel *videoModel;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;


@end
