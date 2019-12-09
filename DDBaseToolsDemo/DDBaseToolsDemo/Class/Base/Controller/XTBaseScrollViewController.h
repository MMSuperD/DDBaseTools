//
//   FileName:  FNewBaseScrollViewController.h
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/8/7
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface XTBaseScrollViewController : XTBaseViewController

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *contentView;



@end

NS_ASSUME_NONNULL_END
