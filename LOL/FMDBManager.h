//
//  FMDBManager.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HistoryModel.h"
#import "FMDatabase.h"

@interface FMDBManager : NSObject {

    FMDatabase *_dataBase;

}

+ (instancetype)shareInstance;
- (instancetype)init;

- (void)insertIntoWithName:(NSString *)image titleS:(NSString *)title dateS:(NSString *)date countS:(NSString *)count videoURL:(NSString *)url;

- (void)deleteWithModel:(HistoryModel *)model;

- (NSMutableArray *)select;

- (void)clear;

@end
