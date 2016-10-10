//
//  RecommendUserView.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "RecommendUserView.h"
#import "RecommendUserCell.h"

NSString *const RecommendUserCellId = @"RecommendUserCellId";

@interface RecommendUserView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation RecommendUserView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 注册cell
        [self registerClass:[RecommendUserCell class] forCellWithReuseIdentifier:RecommendUserCellId];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.recommendUserButtons.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecommendUserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RecommendUserCellId forIndexPath:indexPath];
    cell.buttonList = self.recommendUserButtons[indexPath.item];
    return cell;
}

@end
