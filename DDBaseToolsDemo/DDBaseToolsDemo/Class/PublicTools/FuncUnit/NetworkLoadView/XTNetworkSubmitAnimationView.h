//
//   FileName:  XTNetworkSubmitAnimationView.h
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/1
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,SubmitStatus) {
    SubmitStatusNormal = 0,
    SubmitStatusDoing ,
    SubmitStatusSuccess,
    SubmitStatusFailed,
};

@interface XTNetworkSubmitAnimationView : UIView

@property (nonatomic ,assign)SubmitStatus submitStatus;//!状态
@property (nonatomic ,strong)UIColor *mainColor;//!主色调
@property (nonatomic ,assign)CGFloat lineWidth;//!线宽


@end

NS_ASSUME_NONNULL_END
