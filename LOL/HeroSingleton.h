//
//  HeroSingleton.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroSingleton : NSObject

@property (nonatomic, strong) NSString *heroId;
@property (nonatomic, strong) NSString *cName;
@property (nonatomic, strong) NSMutableArray *array;

+(HeroSingleton *)shareData;

@end
