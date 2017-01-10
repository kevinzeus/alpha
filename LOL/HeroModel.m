//
//  HeroModel.m
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        
        self.Id = dictionary[@"Id"];
        self.Pic = dictionary[@"Pic"];
        self.NickName = dictionary[@"NickName"];
        self.CName = dictionary[@"CName"];
        self.PubTime = dictionary[@"PubTime"];
        self.VideoCount = dictionary[@"VideoCount"];
    }

    return self;
}

@end










