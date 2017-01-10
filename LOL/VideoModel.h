//
//  VideoModel.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *P;
@property (nonatomic, copy) NSString *T;
@property (nonatomic, copy) NSString *A;
@property (nonatomic, copy) NSString *I;
@property (nonatomic, copy) NSString *V;
@property (nonatomic, copy) NSString *Key;
@property (nonatomic, copy) NSArray *F;

// 创建对象对象方法
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
