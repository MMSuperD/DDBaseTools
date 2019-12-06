//
//   FileName:  ViewTools.h
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/9/16
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XTServiceBreakView,XTListNoDataView;

NS_ASSUME_NONNULL_BEGIN

@interface ViewTools : NSObject

@property (nonatomic,weak)UIViewController *currentViewController;

@property (nonatomic,weak)UINavigationController *currentNavViewController;

@property (nonatomic,weak)UIScrollView *currentScrollView;

@property (nonatomic,weak)UITableView *currentTableView;

@property (nonatomic,weak)UIView *currentControllerView;

@property (nonatomic,weak)XTServiceBreakView *serviceBreakView;

@property (nonatomic,weak)XTListNoDataView *listNoDataView;

+ (instancetype)sharedInstance;

// 删除上一个控制器界面
+ (void)deleteCurrentController:(nullable UINavigationController *)nv;

@end

NS_ASSUME_NONNULL_END
