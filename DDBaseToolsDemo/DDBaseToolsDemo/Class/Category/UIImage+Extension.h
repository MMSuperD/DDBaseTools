//
//   FileName:  UIImage+Extension.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

/**
 *  根据图片名自动加载适配iOS6\7的图片
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 * 将图片裁剪为正方形
 */
- (UIImage *)clipImageInSquare;
/**
 * 裁剪到2：1
 */
- (UIImage *)clipImageInTwo_OneSquare;
/**
 * 按照给与的比例裁剪
 * @param scale 裁剪的长宽比
 * @return
 */
- (UIImage *)clipImageInScale:(CGFloat)scale;
/**
 * 截屏
 */
+ (UIImage *)captureWithView:(UIView *)view;
/**
 * 图片压缩
 */
- (UIImage *)scaleImage;
/**
 * 根据颜色生成图片
 */
- (UIImage *)creatImageWithColor:(UIColor *)color;
+ (UIImage *)creatImageWithColor:(UIColor *)color;

/**
 *  返回圆形图片
 */
- (instancetype)circleImage;
- (UIImage *)circleImageInSize:(CGSize)size;

+ (instancetype)circleImage:(NSString *)name;

- (UIImage *)compressTargetWidth:(CGFloat)defineWidth;
/** 返回动图   */
+ (UIImage*)gifImageWithData:(NSData*)data;
+ (UIImage*)gifImageWithData:(NSData*)data duration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
