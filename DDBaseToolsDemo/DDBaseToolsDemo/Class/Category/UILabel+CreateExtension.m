//
//   FileName:  UILabel+CreateExtension.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/21
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "UILabel+CreateExtension.h"
#import "UIColor+functionExtension.h"

@implementation UILabel (CreateExtension)

+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font {
    UILabel *label = [UILabel new];
      label.text = text;
      label.font = font;
      return label;
}
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color {
    UILabel *label = [self labelWithText:text font:font];
    label.textColor = color;
    return label;
}
+ (instancetype)labelWithText:(NSString *)text font:(UIFont *)font hexColor:(uint32_t)hexColor {
    UIColor *color = [UIColor dd_colorWithHex:hexColor];
    return [self labelWithText:text font:font textColor:color];
}
+ (instancetype)labelWithText:(NSString *)text font:(CGFloat)font textColorStr:(NSString *)colorStr {
     return  [self labelWithText:text font:font textColor:colorStr typeFace:@"PingFangSC-Regular" textAlignment:NSTextAlignmentLeft];
}
+ (instancetype)labelWithText:(NSString *)text font:(CGFloat)font textColor:(NSString *)colorStr typeFace:(NSString *)typeFaceName textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [UILabel labelWithText:text font:[UIFont systemFontOfSize:font] textColor:[UIColor colorWithHexString:colorStr]];
     if (typeFaceName) {
         [label setFont:[UIFont fontWithName:typeFaceName size:font]];
     } else {
         [label setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:font]]; //兰亭雅黑
     }
     
     if (textAlignment) {
         label.textAlignment = textAlignment;
     } else {
         label.textAlignment = NSTextAlignmentCenter;
     }
     return label;
}
@end
