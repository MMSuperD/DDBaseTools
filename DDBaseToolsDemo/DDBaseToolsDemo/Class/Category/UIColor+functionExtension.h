//
//   FileName:  UIColor+functionExtension.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/19
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (functionExtension)

+ (instancetype)dd_colorWithHex:(uint32_t)hex;
+ (instancetype)dd_colorWithR:(int)red G:(int)green B:(int)blue alpha:(float)alpha;
+ (instancetype)dd_randomColor;
+ (instancetype)colorWithHexString: (NSString *)color;

@end

NS_ASSUME_NONNULL_END
