//
//  CWCustomButton.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "CWCustomButton.h"

@implementation CWCustomButton


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.titleLabel.frame = CGRectMake(0, self.bounds.size.width, self.bounds.size.width,self.bounds.size.width - self.bounds.size.width);
}

@end
