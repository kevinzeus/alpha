//
//  AnchorTableViewCell.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnchorModel.h"

@interface AnchorTableViewCell : UITableViewCell

@property (nonatomic, strong) AnchorModel *anchorModel;
@property (nonatomic, strong) UIImageView *shotImage;
@property (nonatomic, strong) UILabel *titleName;
@property (nonatomic, strong) UILabel *upDate;
@property (nonatomic, strong) UILabel *videoLength;

+(instancetype)loadCellWithTableView:(UITableView *)tableView;
@end
