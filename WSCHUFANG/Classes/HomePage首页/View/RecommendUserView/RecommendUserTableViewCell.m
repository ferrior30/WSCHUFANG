//
//  RecommendUserTableViewCell.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "RecommendUserTableViewCell.h"
#import "RecommendUserView.h"

@interface RecommendUserTableViewCell ()
@property (weak, nonatomic) RecommendUserView *recommendUserView;
@end

@implementation RecommendUserTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        // 添加recommendView
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        flowlayout.itemSize = CGSizeMake(50, 70);
        flowlayout.minimumInteritemSpacing = 10;
        flowlayout.minimumLineSpacing = 0;
        
        RecommendUserView *recommendUserView = [[RecommendUserView alloc] initWithFrame:self.bounds collectionViewLayout:flowlayout];
        [self.contentView addSubview:recommendUserView];
        self.recommendUserView = recommendUserView;
    }
    
    return self;
}

- (void)setRecommendUserButtons:(NSArray *)recommendUserButtons {
    _recommendUserButtons = recommendUserButtons;
    
    self.recommendUserView.recommendUserButtons = self.recommendUserButtons;
}

@end
