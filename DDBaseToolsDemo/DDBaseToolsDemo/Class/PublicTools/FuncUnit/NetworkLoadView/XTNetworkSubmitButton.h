//
//   FileName:  XTNetworkSubmitButton.h
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/1
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>
#import "XTNetworkSubmitAnimationView.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^LXSubmitClick)(SubmitStatus submitStatus);

@interface XTNetworkSubmitButton : UIView

//各状态文本
@property (strong,nonatomic)NSString *normalStatusText;
@property (strong,nonatomic)NSString *doingStatusText;
@property (strong,nonatomic)NSString *successStatusText;
@property (strong,nonatomic)NSString *failedStatusText;

@property (strong,nonatomic)UIFont *textFont;
@property (strong,nonatomic)UIColor *textColor;

@property (nonatomic,assign)SubmitStatus submitStatus;
@property (nonatomic ,copy)LXSubmitClick submitClick;

@end

NS_ASSUME_NONNULL_END
