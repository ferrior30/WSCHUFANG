//
//  NetworkTool.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool
//+ (void)POST:(nonnull NSString *)url parameters:(nullable id)parameters success:(void (^)(id _Nullable responseObject))successBlock failure:(nullable void (^)(NSError *error))failureBlock {
//   
//   
//}

+ (void)POST:(NSString *)url parameters:(id)parameters success:(void (^)(id _Nullable))successBlock failure:(void (^)(NSError * _Nullable))failureBlock {
    [[AFHTTPSessionManager manager] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

+ (void)GET:(NSString *)url parameters:(id)parameters success:(void (^)(id _Nullable))successBlock failure:(void (^)(NSError * _Nullable))failureBlock {
    [[AFHTTPSessionManager manager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}
@end
