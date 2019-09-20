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

//判断8
#define IS_IPHONE6  (SCREEN_SWIDTH == 375 &&  SCREEN_SHEIGHT == 667)

//判断plus
#define IS_IPHONE6P  (SCREEN_SWIDTH == 414 &&  SCREEN_SHEIGHT == 736)

//判断iPhoneX
#define IS_iPhoneX (SCREEN_SWIDTH == 375 &&  SCREEN_SHEIGHT == 812)

//判断iPHoneXS
#define IS_IPHONE_XS (SCREEN_SWIDTH == 375 &&  SCREEN_SHEIGHT == 812)

//判断iPhoneXR
#define IS_IPHONE_XR (SCREEN_SWIDTH == 414 &&  SCREEN_SHEIGHT == 896)

//判断iPhoneXS Max
#define IS_IPHONE_XS_Max (SCREEN_SWIDTH == 414 &&  SCREEN_SHEIGHT == 896)

//判断iPHoneXS
#define IS_IPHONE_11 (SCREEN_SWIDTH == 375 &&  SCREEN_SHEIGHT == 812)

//判断iPhoneXR
#define IS_IPHONE_11_Pro (SCREEN_SWIDTH == 414 &&  SCREEN_SHEIGHT == 896)

//判断iPhoneXS Max
#define IS_IPHONE_11_Pro_Max (SCREEN_SWIDTH == 414 &&  SCREEN_SHEIGHT == 896)

#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

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
