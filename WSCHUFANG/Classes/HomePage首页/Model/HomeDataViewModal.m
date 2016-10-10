//
//  HomeDataViewModal.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "HomeDataViewModal.h"
#import "NetworkTool.h"
#import "Banner.h"
#import "ButtonList.h"
#import "RecommendUserList.h"

@interface HomeDataViewModal ()
@end

/**
 * device	iPhone8,1
 * machine	Oe465ee7d2c21f604916deace6307de8014615245
 * version	12.8.0.7
 */
@implementation HomeDataViewModal
- (void)requestData:(void (^)())filishBack error:(void (^)())errorBack {
    NSDictionary *paras = @{@"device": @"iPhone8,1",
                            @"machine": @"Oe465ee7d2c21f604916deace6307de8014615245",
                            @"version": @"12.8.0.7"};
    
    NSString *URL = @"http://api.ecook.cn/public/getDifferentHomedata.shtml";

    [NetworkTool POST:URL parameters:paras success:^(id  _Nullable responseObject) {
       
        // 1.无限轮播banner数据
        NSMutableArray *bannerArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject[@"data"][@"bannerList"]) {
            Banner *banner =   [Banner bannerWithDict:dict];

            [bannerArray addObject:banner];
        }
        
        self.bannerArray = bannerArray;
        
        // 2.buttonList数据
        NSMutableArray *buttonArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject[@"data"][@"buttonList"]) {
            ButtonList *btnList = [ButtonList buttonLithWithDict:dict];
            [buttonArray addObject:btnList];
        }
        self.buttonArray = buttonArray;
        
        // 3.recommendUserList数据
        NSMutableArray *recommendUserArray = [NSMutableArray array];
        for (NSDictionary *dict in responseObject[@"data"][@"recommendUserList"]) {
            RecommendUserList *recommendUser = [RecommendUserList recommandUserListWithDict:dict];
            [buttonArray addObject:recommendUser];
        }
        self.recommendUserArray = recommendUserArray;
        
        filishBack();
        
    } failure:^(NSError * _Nullable error) {
        NSLog(@"error");
        errorBack();
        
    }];
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray= bannerArray;
    
    NSMutableArray *imageNames = [NSMutableArray array];
    for (Banner *banner in bannerArray) {
        NSString *url = [NSString  stringWithFormat:@"http://pic.ecook.cn/web/%@.jpg", banner.image];
        [imageNames addObject:url];
    }
    self.bannerImageNames = imageNames;
}
@end
