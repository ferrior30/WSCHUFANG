//
//  CWHomeTableViewController.m
//  WSCHUFANG
//
//  Created by ChenWei on 16/9/21.
//  Copyright © 2016年 cw. All rights reserved.
//

#import "CWHomeTableViewController.h"
#import "CWHomeCustomNavBar.h"
#import "CWHomeHeaderView.h"
#import "CWCircleView.h"
#import "HomeDataViewModal.h"
#import "RecommendUserTableViewCell.h"

NSString *const RecommendUserTableViewCellID = @"RecommendUserTableViewCellID";

@interface CWHomeTableViewController ()
@property (strong, nonatomic) HomeDataViewModal *HomeDataViewModal;
@end

@implementation CWHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

    
    // 1. 添加子控件
    [self setupUI];
    
    // 2.viewModel
    HomeDataViewModal *homeViewModel = [[HomeDataViewModal alloc] init];
    // 2.1请求数据
    [homeViewModel requestData:^{
         ((CWCircleView *)(self.tableView.tableHeaderView.subviews.firstObject)).imageNames = homeViewModel.bannerImageNames;
        
        [self.tableView reloadData];
    } error:^{
        NSLog(@"homeViewModel requestData = error");
    }];
    
    // 3.注册cell
    [self.tableView registerClass:[RecommendUserTableViewCell class] forCellReuseIdentifier:RecommendUserTableViewCellID];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.customNavBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.customNavBar.hidden = YES;
}

#pragma mark - 添加子控件
- (void)setupUI {
    // 1.添加无限滚动为headerView
    
    CGRect frame = CGRectMake(0, 64, CWScreenW, 176+ 20);
    UIView *heaerView = [[UIView alloc] initWithFrame:frame];
    CWCircleView *circleView = [[CWCircleView alloc] initWithFrame:CGRectInset(heaerView.bounds, 0, 10)];
    circleView.imageViewSize = CGSizeMake(316, circleView.bounds.size.height);
//    circleView.imageNames = @[@"", @"", @""];
    [heaerView addSubview:circleView];
    
    heaerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = heaerView;
    
    // 2.添加buttonListView
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 1) { // recommand
        RecommendUserTableViewCell *cell = (RecommendUserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:RecommendUserTableViewCellID];
        cell.recommendUserButtons = self.HomeDataViewModal.recommendUserArray;
        return cell;

    }else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.text = @"秒";
        return cell;
    }
    
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"第二页";
    vc.view.backgroundColor = [UIColor redColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
