//
//   FileName:  AppMacro.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#ifndef AppMacro_h
#define AppMacro_h

// 屏幕的高度
#define SCREEN_SHEIGHT ([[UIScreen mainScreen] bounds].size.height)

//屏幕的宽度
#define SCREEN_SWIDTH  ([[UIScreen mainScreen] bounds].size.width)

//状态栏的高度
#define STATUSBAR_HEIGHT  (IS_IPHONE_XXX == YES ? 44.f : 20.f)

//导航栏高度
#define NVA_HEIGHT (IS_IPHONE_XXX == YES ? 88.f : 64.f)

#define UISCREEN_CURRENTMODE ([UIScreen instancesRespondToSelector:@selector(currentMode)])
//判断设备类型
// 判断是否是iPhone 4
#define IS_IPHONE_4 ([UIScreen mainScreen].bounds.size.height == 480)

// 判断是否是iPhone 5
#define IS_IPHONE_5 (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone  6, 7, 8
#define IS_IPHONE_678 (UISCREEN_CURRENTMODE ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
// 判断是否是iPhone 6, 7, 8 plus
#define IS_IPHONE_678_PLUS (UISCREEN_CURRENTMODE ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

// 判断是否是iPhone X
#define IS_IPHONE_X (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone XR
#define IS_IPHONE_X_R (UISCREEN_CURRENTMODE? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone XS
#define IS_IPHONE_X_S (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone X Max
#define IS_IPHONE_X_MAX (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone 11
#define IS_IPHONE_11 (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone 11 PRO
#define IS_IPHONE_11_PRO (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断是否是iPhone 11 PROMAX
#define IS_IPHONE_11_PROMAX (UISCREEN_CURRENTMODE ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

//判断是否是iphoneX 刘海 系列的
#define IS_IPHONE_BAND ( IS_IPHONE_X == YES || IS_IPHONE_X_R == YES || IS_IPHONE_X_S == YES || IS_IPHONE_X_MAX == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_PRO == YES || IS_IPHONE_11_PROMAX == YES)

// 是否是IPhoneX 系列刘海屏
#define IS_IPHONE_XXX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
isPhoneX = YES;\
}\
}\
isPhoneX;\
})

//系统类型
#define IOSVERSION ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define IOS7 (IOSVERSION >= 7.0)
#define IOS8 (IOSVERSION >= 8.0)
#define IOS9 (IOSVERSION >= 9.0)
#define IOS10 (IOSVERSION >= 10.0)
#define IOS11 (IOSVERSION >= 11.0)
#define IOS12 (IOSVERSION >= 12.0)
#define IOS13 (IOSVERSION >= 13.0)

#pragma mark -- <输出> --

#ifdef DEBUG
#define NSLog(fat, ...) NSLog((@"%s [Line %d] " fat), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif


#endif /* AppMacro_h */
