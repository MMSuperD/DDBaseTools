//
//   FileName:  AppEnum.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#ifndef AppEnum_h
#define AppEnum_h

#pragma mark -- <只能object - c 文件引用> --
#ifdef  __OBJC__

typedef NS_ENUM(NSUInteger, ResultType) {
    ResultType_error = 10,
    ResultType_noData = 11,
    ResultType_haveData = 12
};


#endif

#endif /* AppEnum_h */
