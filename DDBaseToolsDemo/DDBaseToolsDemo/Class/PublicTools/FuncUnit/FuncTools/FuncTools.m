//
//   FileName:  FuncTools.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/12/9
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "FuncTools.h"
#import "XTServiceBreakView.h"
#import "XTListNoDataView.h"
#import "XTGuidePageViewController.h"

@implementation FuncTools

/// 去引导页
- (void)goGuidePageController {
    XTGuidePageViewController *vc = [XTGuidePageViewController new];
               [vc showGuideViewWithImageArray:@[@"life_banner_1",@"life_banner_2",@"life_banner_3",@"life_banner_4"] WindowRootController:[[UINavigationController alloc] initWithRootViewController:[UIViewController new]]];
     [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

// 显示服务器异常界面
+ (void)showServicePage {
    [XTServiceBreakView showView];
}

// 去除服务器异常界面
+ (void)hiddenServicePage {
    [XTServiceBreakView hiddenView];
}

// 显示没有数据数据图片
+ (void)showNoListDataPage {
    [XTListNoDataView showView];
    
}

// 去除没有数据图片
+ (void)hiddenNoListDataPage {
    [XTListNoDataView hiddenView];
}

@end
