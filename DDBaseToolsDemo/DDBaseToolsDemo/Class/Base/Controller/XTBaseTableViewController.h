//
//   FileName:  FNewBaseTableViewController.h
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/8/2
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface XTBaseTableViewController : XTBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,assign)NSInteger currentPage;

@property (nonatomic,assign)NSInteger currentSize;

@property (nonatomic,assign)NSInteger currentRequestCount;

@property (nonatomic,assign)UITableViewStyle style;

@property (nonatomic, strong) UIView *footView;

// 添加头部刷新 默认添加 如果不需要添加,重写该方法
- (void)addHeaderRefresh;
// 添加底部刷新 默认添加,如果不需要添加,重写该方法
- (void)addFooterRefresh;
// 加载更多数据
- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
