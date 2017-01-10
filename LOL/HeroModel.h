//
//  HeroModel.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *Pic;
@property (nonatomic, copy) NSString *NickName;
@property (nonatomic, copy) NSString *CName;
@property (nonatomic, copy) NSString *PubTime;
@property (nonatomic, copy) NSString *VideoCount;
// 创建对象对象方法
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
