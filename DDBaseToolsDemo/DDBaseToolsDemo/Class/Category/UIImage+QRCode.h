//
//   FileName:  UIImage+QRCode.h
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

@interface UIImage (QRCode)

/**
 *  生成二维码
 *
 *  @return 生成二维码的UIImage对象
 */
+ (UIImage *)createQRCodeWithData:(NSString *)dataString logoImage:(UIImage *)logoImage imageSize:(CGFloat)size;

/**
 *  生成条形码
 *
 *  @return 生成条形码的UIImage对象
 */
+ (UIImage *)resizeCodeWithString:(NSString *)text BCSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
