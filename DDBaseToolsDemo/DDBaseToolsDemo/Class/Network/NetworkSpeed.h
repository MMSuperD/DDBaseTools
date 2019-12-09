//
//   FileName:  NetworkSpeed.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/10/23
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  @{@"received":@"100kB/s"}
 */
FOUNDATION_EXTERN NSString * _Nullable const kNetworkReceivedSpeedNotification;
/**
 *  @{@"send":@"100kB/s"}
 */
FOUNDATION_EXTERN NSString * _Nullable const kNetworkSendSpeedNotification;
NS_ASSUME_NONNULL_BEGIN

@interface NetworkSpeed : NSObject

@property (nonatomic, copy, readonly) NSString * receivedNetworkSpeed;

@property (nonatomic, copy, readonly) NSString * sendNetworkSpeed;

+ (instancetype)shareNetworkSpeed;
- (void)startMonitoringNetworkSpeed;
- (void)stopMonitoringNetworkSpeed;

@end

NS_ASSUME_NONNULL_END
