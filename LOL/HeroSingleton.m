//
//  HeroSingleton.m
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import "HeroSingleton.h"

@implementation HeroSingleton

+(HeroSingleton *)shareData {
    
    static HeroSingleton *heroId = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        heroId = [[HeroSingleton alloc] init];
    });

    return heroId;
}
@end
