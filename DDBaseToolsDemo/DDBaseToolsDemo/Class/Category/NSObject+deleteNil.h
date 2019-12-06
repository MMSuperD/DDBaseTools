//
//   FileName:  NSObject+deleteNil.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/25
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (deleteNil)
// 除空数据 NSDictionary NSArray 
- (id)deleteNil:(id)data;

@end

NS_ASSUME_NONNULL_END
