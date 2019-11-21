//
//   FileName:  UILabel+CreateExtension.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/21
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (CreateExtension)

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font;
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color;
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font hexColor:(uint32_t)hexColor;
+ (instancetype)labelWithText:(NSString *)text font:(CGFloat)font textColorStr:(NSString *)colorStr;
+ (instancetype)labelWithText:(NSString *)text font:(CGFloat)font textColor:(NSString *)colorStr typeFace:(NSString *)typeFaceName textAlignment:(NSTextAlignment)textAlignment;

@end

NS_ASSUME_NONNULL_END
