//
//  HomeDataViewModal.h
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataViewModal : NSObject

@property (strong, nonatomic) NSArray *bannerArray;
/** 存放无限轮播的图片url数组 */
@property (strong, nonatomic) NSArray *bannerImageNames;
@property (strong, nonatomic) NSArray *recommendUserArray;
@property (strong, nonatomic) NSArray *buttonArray;
//- (void)requestData;
- (void)requestData:(void (^)())filishBack error:(void (^)())errorBack;
@end
