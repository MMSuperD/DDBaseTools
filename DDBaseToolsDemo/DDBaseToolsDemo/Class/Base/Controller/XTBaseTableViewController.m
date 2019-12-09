//
//   FileName:  FNewBaseTableViewController.m
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/8/2
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTBaseTableViewController.h"

@interface XTBaseTableViewController ()

@property (nonatomic, strong) UILabel *bottom1Lab;
@property (nonatomic, strong) UILabel *bottom2Lab;

@end

@implementation XTBaseTableViewController

// 这个方法是为了 列表界面提示图
- (void)setCurrentRequestCount:(NSInteger)currentRequestCount {
    _currentRequestCount = currentRequestCount;
    if (self.currentPage == 1 && currentRequestCount == 0) {
        [FuncTools showNoListDataPage];
    } else {
        [FuncTools hiddenNoListDataPage];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self addHeaderRefresh];
    [self addFooterRefresh];
    [ViewTools sharedInstance].currentTableView = _tableView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [ViewTools sharedInstance].currentTableView = _tableView;
}

- (void)addChildSubview {
    
    
}


#pragma mark 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
//        [self.view addSubview:_tableView];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.frame = CGRectMake(0, NVA_HEIGHT, SCREEN_SWIDTH, SCREEN_SHEIGHT - NVA_HEIGHT);
        _tableView.estimatedRowHeight = 80;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0,*)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

#pragma mark <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

// 添加头部刷新
- (void)addHeaderRefresh {
    __weak XTBaseTableViewController *weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    
    
}

// 添加底部刷新
- (void)addFooterRefresh {
    __weak XTBaseTableViewController *weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}

// 加载更多数据
- (void)loadMoreData {
    
}


@end
