//
//   FileName:  XTTipViewTool.h
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/2
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XTTipViewTool : NSObject

+(instancetype)share;

// 显示加载View
+ (void)showLoadView;
// 带背景色的加载 View
+ (void)showNOHiddenLoadViewWityhBGColor:(UIColor *)bgColor;
// 隐藏加载View
+ (void)hiddenLoadView;

@end

NS_ASSUME_NONNULL_END
