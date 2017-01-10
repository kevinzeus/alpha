//
//  HeroTableViewCell.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroModel.h"

@interface HeroTableViewCell : UITableViewCell

@property (nonatomic, strong) HeroModel *heroData;

+ (instancetype)loadCellWithTableView:(UITableView *)tableView;

@end
