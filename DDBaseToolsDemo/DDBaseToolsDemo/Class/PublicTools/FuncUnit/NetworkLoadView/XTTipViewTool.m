//
//   FileName:  XTTipViewTool.m
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/2
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTTipViewTool.h"
#import "XTNetworkLoadView.h"

@interface XTTipViewTool()

//// 整个手机View
//@property (nonatomic,strong)UIView *fullScreenView;
//
//// 除了导航没有被遮盖,左右边距大概在 15 边距 edge(64,15,015)
//@property (nonatomic,strong)UIView *currentView;

@end

@implementation XTTipViewTool

static UIView   *_currentFullScreenView;
static UIView   *_currentView;
static UIView   *_waitView;
static UIView  *_titleLabel;
static UIView   *_whiteView;


+ (instancetype)share {
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (UIView *)currentControlView {
    return [ViewTools sharedInstance].currentControllerView;
}

// 显示加载View
+ (void)showLoadView {
    
    // 这个是移除当前的显示loading
    if (_currentView) {
        [_waitView removeFromSuperview];
        [_whiteView removeFromSuperview];
        [_currentView removeFromSuperview];
        _whiteView = nil;
        _waitView = nil;
        _currentView = nil;
        _titleLabel = nil;
    }
    
    _currentView = [UIView new];
    [[XTTipViewTool currentControlView] addSubview:_currentView];
    _currentView.frame = CGRectMake(0, NVA_HEIGHT, SCREEN_SWIDTH, SCREEN_SHEIGHT - NVA_HEIGHT);
    _currentView.backgroundColor = [UIColor clearColor];
    
    _whiteView = [UIView new];
    _whiteView.backgroundColor = [UIColor blackColor];
    [_currentView addSubview:_whiteView];
    _whiteView.bounds = CGRectMake(0, 0, 100, 100);
    _whiteView.center = CGPointMake(SCREEN_SWIDTH * 1.0 / 2, (_currentView.height * 1.0/ 2) - 40);
    _whiteView.radius = 4;

    _waitView = [[XTNetworkLoadView alloc] initWithFrame:CGRectZero];
    [_whiteView addSubview:_waitView];
   
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"加载中";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor grayColor];
    _titleLabel = titleLabel;
    [_whiteView addSubview:_titleLabel];
    _waitView.frame = CGRectMake(25, 10, 50, 50);
    _titleLabel.centerX = _waitView.centerX;
    _titleLabel.y = 65;
}

// 显示加载View
+ (void)showNOHiddenLoadViewWityhBGColor:(UIColor *)bgColor {
    
    // 这个是移除当前的显示loading
    if (_currentView) {
        [_waitView removeFromSuperview];
        [_whiteView removeFromSuperview];
        [_currentView removeFromSuperview];
        _whiteView = nil;
        _waitView = nil;
        _currentView = nil;
        _titleLabel = nil;
    }
    
    _currentView = [UIView new];
    [[XTTipViewTool currentControlView] addSubview:_currentView];
    _currentView.frame = CGRectMake(0, NVA_HEIGHT, SCREEN_SWIDTH, SCREEN_SHEIGHT - NVA_HEIGHT);
    if (!bgColor) {
        bgColor = [UIColor whiteColor];
    }
    _currentView.backgroundColor = bgColor;
    
    _whiteView = [UIView new];
    _whiteView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.5f];
    [_currentView addSubview:_whiteView];
    _whiteView.bounds = CGRectMake(0, 0, 120, 120);
    _whiteView.center = CGPointMake(SCREEN_SWIDTH * 1.0 / 2, (_currentView.height * 1.0/ 2) - 80);
    _whiteView.radius = 4;

    _waitView = [[XTNetworkLoadView alloc] initWithFrame:CGRectZero];
    [_whiteView addSubview:_waitView];
   
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"加载中";
    [titleLabel sizeToFit];
    titleLabel.textColor = [UIColor whiteColor];
    _titleLabel = titleLabel;
    [_whiteView addSubview:_titleLabel];
    _waitView.frame = CGRectMake(30, 15, 60, 60);
    _titleLabel.centerX = _waitView.centerX;
    _titleLabel.y = 90.f;
}

// 隐藏加载View
+ (void)hiddenLoadView {
    
    [UIView animateWithDuration:0.25 animations:^{
        _waitView.alpha = 0;
        _currentView.alpha = 0;
        _titleLabel.alpha = 0;
        _whiteView.alpha = 0;
    }completion:^(BOOL finished) {
        [_waitView removeFromSuperview];
        [_whiteView removeFromSuperview];
        [_currentView removeFromSuperview];
        _whiteView = nil;
        _waitView = nil;
        _currentView = nil;
        _titleLabel = nil;
    }];

}



@end
