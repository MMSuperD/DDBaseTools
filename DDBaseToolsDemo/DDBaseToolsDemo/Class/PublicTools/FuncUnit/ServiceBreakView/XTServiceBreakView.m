//
//   FileName:  XTServiceBreakView.m
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/18
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTServiceBreakView.h"
#import "XTBaseViewController.h"
@interface XTServiceBreakView()

@property (nonatomic,strong)UIImageView *serviceImageV;

@property (nonatomic,strong)UIControl *backView;

@end

@implementation XTServiceBreakView

+ (void)showView {
    
    if ([ViewTools sharedInstance].serviceBreakView ){
          [[ViewTools sharedInstance].serviceBreakView removeFromSuperview];
      }
    
    XTServiceBreakView *hh = [[XTServiceBreakView alloc] initWithFrame:CGRectZero];
    UIView *currentView =  [ViewTools sharedInstance].currentControllerView;
    [currentView addSubview:hh];
    [ViewTools sharedInstance].serviceBreakView = hh;
    [hh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(currentView);
        make.top.mas_equalTo(currentView.mas_top).mas_offset(NVA_HEIGHT);
    }];
}

+ (void)hiddenView {
    if ([ViewTools sharedInstance].serviceBreakView ){
        [[ViewTools sharedInstance].serviceBreakView removeFromSuperview];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
        
        //[self addTarget:self action:@selector(actionControl:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)actionControl:(UIControl *)control {
    
    if ([[ViewTools sharedInstance].currentViewController respondsToSelector:@selector(loadData)]) {
   //     [[ViewTools sharedInstance].currentViewController loadData];
    }
//    
//    XTBaseViewController *currentVc =  (XTBaseViewController *)[ViewTools sharedInstance].currentViewController;
//    [currentVc loadData];
}

- (void)addChildView {
    
    self.backView = [UIControl new];
    [self addSubview:self.backView];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.backView addTarget:self action:@selector(actionControl:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    self.serviceImageV = [UIImageView new];
    [self.serviceImageV setImage:I(@"icon_server_break")];
    [self.backView addSubview:self.serviceImageV];
    self.serviceImageV.userInteractionEnabled = NO;
    [self.serviceImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.backView);
    }];
    
    UILabel *tipLabel = [UILabel labelWithText:@"点击重新架子" font:17 textColorStr:@"0x888888"];
    [self.backView addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.serviceImageV.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self.serviceImageV);
    }];
}

@end
