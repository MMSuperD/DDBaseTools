//
//   FileName:  ReachablityTool.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/10/23
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "ReachablityTool.h"


@implementation ReachablityTool
{
    Reachability *_hostReachability;
    Reachability *_internetReachability;
    NetworkStatu _wifiNetwork,_dataNetwork,_noKnowNetwork;
}

IMPLEMENTATION_SINGLETON(ReachablityTool)

- (instancetype)init
{
    self = [super init];
    if (self) {
        
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        //设置网络监测站点
        NSString *remoteHostName = @"www.baidu.com";
        
        _hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
        [_hostReachability startNotifier];
        
        _internetReachability = [Reachability reachabilityForInternetConnection];
        [_internetReachability startNotifier];
        
    }
    return self;
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    
    if (curReach == _hostReachability) {
        [self networkChange:curReach];
    }
    
    if (curReach == _internetReachability) {
        [self networkChange:curReach];
    }
}

- (void)networkChange:(Reachability *)reachability {
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
      {
          case NotReachable:        {
              statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
              /*
               Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
               */
              connectionRequired = NO;
              if (_noKnowNetwork) {
                  _noKnowNetwork();
              }
              
              break;
          }

          case ReachableViaWWAN:        {
              statusString = NSLocalizedString(@"Reachable WWAN", @"");
              if (_dataNetwork) {
                    _dataNetwork();
              }
              break;
          }
          case ReachableViaWiFi:        {
              statusString= NSLocalizedString(@"Reachable WiFi", @"");
              if (_wifiNetwork) {
                  _wifiNetwork();
              }
              break;
          }
      }
      
      if (connectionRequired)
      {
          NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
          statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
      }
    
    NSLog(@"%@",statusString);
}

- (void)networkStatusWifi:(NetworkStatu)wifi data:(NetworkStatu)data noKnowStatu:(NetworkStatu)noKnow {
    _wifiNetwork = wifi;
    _dataNetwork = data;
    _noKnowNetwork = noKnow;
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
