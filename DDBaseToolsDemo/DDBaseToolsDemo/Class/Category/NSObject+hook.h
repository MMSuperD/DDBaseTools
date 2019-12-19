//
//   FileName:  NSObject+hook.h
//   ProjectName:  WX
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/12/19
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (hook)

+ (void)hookClass:(Class)classObject originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
