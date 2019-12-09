//
//   FileName:  FuncTools.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/12/9
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FuncTools : NSObject

/// 去引导页
- (void)goGuidePageController;

// 显示服务器异常界面
+ (void)showServicePage;

// 去除服务器异常界面
+ (void)hiddenServicePage;

// 显示没有数据数据图片
+ (void)showNoListDataPage;

// 去除没有数据图片
+ (void)hiddenNoListDataPage;

@end

NS_ASSUME_NONNULL_END
