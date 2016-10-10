//
//  RecommendUserCell.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "RecommendUserCell.h"
#import <UIButton+WebCache.h>

@implementation RecommendUserCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 添加button
        CWCustomButton *btn = [CWCustomButton buttonWithType:UIButtonTypeCustom];
        self.recommendUserBtn = btn;
        [self.contentView addSubview:btn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.recommendUserBtn.frame = self.bounds;
    self.recommendUserBtn.center = self.center;
}

- (void)setButtonList:(ButtonList *)buttonList {
    _buttonList = buttonList;
    
    [self.recommendUserBtn sd_setImageWithURL:[NSURL URLWithString:buttonList.imageId] forState:UIControlStateNormal];
}
@end
