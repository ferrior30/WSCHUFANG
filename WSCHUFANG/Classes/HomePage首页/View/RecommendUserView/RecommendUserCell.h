//
//  RecommendUserCell.h
//  WSCHUFANG
//
//  Created by ChenWei on 16/10/10.
//  Copyright © 2016年 cw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWCustomButton.h"
#import "ButtonList.h"

@interface RecommendUserCell : UICollectionViewCell
@property (strong, nonatomic) ButtonList *buttonList;
@property (weak, nonatomic) CWCustomButton *recommendUserBtn;
@end
