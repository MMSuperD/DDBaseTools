//
//   FileName:  UIImage+Reduce.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "UIImage+Reduce.h"

@implementation UIImage (Reduce)

- (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    //eate a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}


@end
