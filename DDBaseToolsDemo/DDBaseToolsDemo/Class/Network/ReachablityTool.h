//
//   FileName:  ReachablityTool.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/10/23
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <Foundation/Foundation.h>
#import "DDSingleton.h"
#import "Reachability.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^NetworkStatu)(void);
@interface ReachablityTool : NSObject

INTERFACE_SINGLETON(ReachablityTool)

/// 监听网络状态
/// @param wifi  wifi
/// @param data  5g/4g/3g
/// @param noKnow  不知道的网络
- (void)networkStatusWifi:(NetworkStatu)wifi data:(NetworkStatu)data noKnowStatu:(NetworkStatu)noKnow;

@end

NS_ASSUME_NONNULL_END
