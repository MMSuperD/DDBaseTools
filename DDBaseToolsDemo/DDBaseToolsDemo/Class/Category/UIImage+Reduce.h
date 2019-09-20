//
//   FileName:  UIImage+Reduce.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <AssetsLibrary/AssetsLibrary.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Reduce)

/**
 * 图片压缩
 */
- (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;




@end

NS_ASSUME_NONNULL_END
