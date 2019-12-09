//
//   FileName:  FNewBaseViewController.m
//   ProjectName:  BalanceTransfer
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/7/31
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTBaseViewController.h"

@interface XTBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XTBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isTurnOnNavRightPanGesture = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"order:%s",__FUNCTION__);
    [self addNvView];
    
    if (self.navigationController) {
         [ViewTools sharedInstance].currentNavViewController = self.navigationController;
    }
    [self initNotification];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"order:%s",__FUNCTION__);
    [ViewTools sharedInstance].currentViewController = self;
   
    [self hiddenNVView];
    if (!self.isTurnOnNavRightPanGesture) {
        // 禁用返回手势
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"order:%s",__FUNCTION__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"order:%s",__FUNCTION__);
    // 开启返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"order:%s",__FUNCTION__);
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.titleLabel.text = title;
}



- (void)initNavRightSlideDelegate {
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

// 隐藏系统的导航栏
- (void)hiddenNVView {
    if (self.navigationController) {
        [self.navigationController.navigationBar setHidden:YES];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
}

// 自定义导航栏 默认是有导航栏的 需要重写该方法
- (void)addNvView {
    
    [self.view addSubview:self.nvView];
    
    [self.nvView addSubview:self.lineView];
    
    [self addTitleView];
    
    [self addLeftNvBarBtn];
    
    [self addRightNvBarBtn];
    
}

//  自定义TitleView 需要重写该方法
- (void)addTitleView {
    [self.nvView addSubview:self.titleLabel];
    
}

//  自定义左边按钮 默认只有一个 默认显示 需要重写该方法
- (void)addLeftNvBarBtn {
//    self.leftNvBarBtn.hidden = NO;
    [self.nvView addSubview:self.leftNvBarBtn];
    
}

//  自定义右边按钮 默认只有一个 默认隐藏 需要重写该方法
- (void)addRightNvBarBtn {
//    self.rightNvBarBtn.hidden = YES;
    [self.nvView addSubview:self.rightNvBarBtn];
}


// 添加子控件 需要重写该方法
- (void)addChildSubview {
    
}

// 加载数据
- (void)loadData {
    
}

// 初始化数据
- (void)initData {
    
}

// 服务器异常通知界面
- (void)actionXTServiceBreakNotification:(NSNotification *)sender {
    //[XTFuncTools showServicePage];
}

// 初始化通知
- (void)initNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionFNewBaseViewControllerRefreshDataNofication) name:FNewBaseViewControllerRefreshDataNofication object:nil];
}

// 显示状态栏
- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark 响应事件
// 通知响应事件
- (void)actionFNewBaseViewControllerRefreshDataNofication {
    [self loadData];
}

// 左边按钮点击事件
- (void)leftButtonClick:(UIButton *)sender {
    if (self.navigationController) {
//        for (UIView *tempView in [BaseAlert currentWindow].subviews) {
//            if (tempView.tag == 10008) {
//                [tempView removeFromSuperview];
//                break;
//            }
//        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 右边按钮点击事件
- (void)rightButtonClick:(UIButton *)sender {
    
}

#pragma mark - getter
- (UIView *)nvView {
    if (!_nvView) {
        _nvView = [UIView new];
        _nvView.backgroundColor = [UIColor whiteColor];
        _nvView.frame = CGRectMake(0, 0, SCREEN_SWIDTH, NVA_HEIGHT);
    }
    return _nvView;
}

- (UIView *)lineView {
    if (_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, NVA_HEIGHT - 1, SCREEN_SWIDTH, 1)];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"e9e9e9"];
    }
    return _lineView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60,(44 - 20)/2 + NVA_HEIGHT, SCREEN_SWIDTH - 120, 20)];
        _titleLabel.textColor = [UIColor colorWithHexString:@"333333"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    }
    return _titleLabel;
}

- (UIButton *)leftNvBarBtn {
    if (!_leftNvBarBtn) {
        _leftNvBarBtn = [UIButton buttonWithType:0];
        _leftNvBarBtn.frame = CGRectMake(0, NVA_HEIGHT, 60, 44);
       // [_leftNvBarBtn setHitTestEdgeInsets:UIEdgeInsetsMake(-15, -15, -15, -15)];
        [_leftNvBarBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [_leftNvBarBtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftNvBarBtn;
}

- (UIButton *)rightNvBarBtn {
    if (!_rightNvBarBtn) {
        _rightNvBarBtn = [UIButton buttonWithType:0];
        _rightNvBarBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightNvBarBtn.frame = CGRectMake(SCREEN_SWIDTH - 60 - 15, NVA_HEIGHT, 60, 44);
        [_rightNvBarBtn setTitle:@"" forState:UIControlStateNormal];
        [_rightNvBarBtn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightNvBarBtn;
}

- (UIView *)noNetworkView {
    if (!_noNetworkView) {
        _noNetworkView = [UIView new];
        _noNetworkView.frame = CGRectMake(0, NVA_HEIGHT, SCREEN_SWIDTH, SCREEN_SHEIGHT - NVA_HEIGHT);
        _noNetworkView.backgroundColor = [UIColor orangeColor];
        
    }
    return _noNetworkView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:FNewBaseViewControllerRefreshDataNofication object:nil];
    NSLog(@"%@",NSStringFromClass([self class]));
}

@end
