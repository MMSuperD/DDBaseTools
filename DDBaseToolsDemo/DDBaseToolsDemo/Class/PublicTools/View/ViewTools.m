//
//   FileName:  ViewTools.m
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/9/16
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "ViewTools.h"

@implementation ViewTools

+ (instancetype)sharedInstance {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ViewTools alloc] init];
    });
    return _instance;
}

- (UIView *)currentControllerView {
    return [ViewTools sharedInstance].currentViewController.view;
}

+ (void)deleteCurrentController:(UINavigationController *)nv {
    
    if (nv) {
        
        if (nv.navigationController.viewControllers.count >= 2) {
            NSMutableArray *vcArray = [NSMutableArray array];
            for (int i = 0; i < nv.navigationController.viewControllers.count; i++) {
                if (nv.navigationController.viewControllers.count == i -2) {
                    continue;
                } else {
                    [vcArray addObject:nv.navigationController.viewControllers[i]];
                }
            }
            nv.viewControllers = vcArray;
        }
        
    } else {
        
        if ([ViewTools sharedInstance].currentNavViewController.viewControllers.count >= 2) {
                NSMutableArray *vcArray = [NSMutableArray array];
                for (int i = 0; i < [ViewTools sharedInstance].currentNavViewController.viewControllers.count; i++) {
                    if ([ViewTools sharedInstance].currentNavViewController.viewControllers.count == i -2) {
                        continue;
                    } else {
                        [vcArray addObject:[ViewTools sharedInstance].currentNavViewController.viewControllers[i]];
                    }
                }
                [ViewTools sharedInstance].currentNavViewController.viewControllers = vcArray;
            }
    }
    
}

@end
