//
//   FileName:  FNewBaseViewController.h
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/7/31
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>
#import "AppEnum.h"
// 这个用来全局刷新数据的
#define FNewBaseViewControllerRefreshDataNofication  (@"FNewBaseViewControllerRefreshDataNofication")


typedef void(^ReturnBlock)( _Nullable id);

NS_ASSUME_NONNULL_BEGIN

@interface XTBaseViewController : UIViewController

// 默认导航栏左边返回按钮
@property (nonatomic,strong)UIButton *leftNvBarBtn;

// 默认导航栏右边按钮 默认隐藏
@property (nonatomic,strong)UIButton *rightNvBarBtn;

//  导航View
@property (nonatomic,strong)UIView   *nvView;

//导航栏底部线条
@property (nonatomic, strong) UIView *lineView;

//  标题
@property (nonatomic,strong)UILabel *titleLabel;

// 没有网络时候的View
@property (nonatomic,strong)UIView  *noNetworkView;


// 返回Blcok 
@property (nonatomic,copy)ReturnBlock returnBlock;

// 是否打开右滑导航控制器的右侧滑关闭页面的手势 默认打开 可以侧滑
@property (nonatomic,assign)BOOL isTurnOnNavRightPanGesture;

// 自定义导航栏 默认是有导航栏的 需要重写该方法
- (void)addNvView;

//  自定义TitleView 需要重写该方法
- (void)addTitleView;

//  自定义左边按钮 默认只有一个 默认显示 需要重写该方法
- (void)addLeftNvBarBtn;

//  自定义右边按钮 默认只有一个 默认隐藏 需要重写该方法
- (void)addRightNvBarBtn;

// 添加子控件 需要重写该方法
- (void)addChildSubview;

// 加载数据
- (void)loadData;

// 初始化数据
- (void)initData;

// 初始化通知
- (void)initNotification;

// 左边按钮点击事件
- (void)leftButtonClick:(UIButton *)sender;

// 右边按钮点击事件
- (void)rightButtonClick:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
