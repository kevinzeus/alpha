//
//  NetworkSingleton.h
//  LOL
//
//  Created by kevinzeus on 16/12/8.
//  Copyright © 2016年 kevinzeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NetworkSingleton : AFHTTPSessionManager

+ (NetworkSingleton *)sharedManager;
// - (AFHTTPSessionManager *)baseHtppRequest;

/**
 *  GET请求方法
 *
 *  @param URLString  URLString 请求地址
 *  @param parameters parameters 请求参数
 *  @param success    success 请求成功回调
 *  @param failure    failure 请求失败回调
 */
- (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void(^)(id reponseObject)) success failure:(void(^)(NSError *error))failure;





@end
