//
//  HSSegmentView.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSSegmentView : UIView <UIScrollViewDelegate>


- (instancetype)initWithFrame:(CGRect)frame buttonName:(NSArray*)buttonName contrllers:(NSArray*)contrllers parentController:(UIViewController*)parentC;


@end
