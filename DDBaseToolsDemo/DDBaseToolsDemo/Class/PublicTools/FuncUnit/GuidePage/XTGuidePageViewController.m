//
//   FileName:  XTGuidePageViewController.m
//   ProjectName:  XiaoTongLife
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/10/26
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "XTGuidePageViewController.h"

@interface XTGuidePageViewController ()<UIScrollViewDelegate>

/**
 滚动视图
 */
@property (nonatomic,strong)UIScrollView *scrollView;
/**
 圆点
 */
@property (nonatomic,strong) UIPageControl *pageControl;

/**
 跳过按钮
 */
@property (nonatomic,strong)UIButton *cancelButton;

/**
 跟控制器
 */
@property (nonatomic,strong)UIViewController *rootController;

@end

@implementation XTGuidePageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildSubview];
}

- (void)addChildSubview {
    self.nvView.hidden = YES;
    [self createScrollView];
    [self createPageControl];
    [self createCancelButton];
}

- (void)createScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(SCREEN_SWIDTH *self.imageArray.count, SCREEN_SHEIGHT);
    [self.view addSubview:_scrollView];
    for (int i = 0; i < self.imageArray.count; i++) {
        NSString *imageName = self.imageArray[i];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor = [UIColor purpleColor];
        imageView.frame = CGRectMake(SCREEN_SWIDTH * i, 0, SCREEN_SWIDTH, SCREEN_SHEIGHT);
        [_scrollView addSubview:imageView];
        // 判断是否为gif
        if ( [imageName.pathExtension.lowercaseString isEqualToString:@"gif"]) {
            // sd_animatedGIFNamed 不能带.gif 后缀否则只能加载第一张
            // 过滤掉 .gif
            NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
            imageView.image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfFile:path]];
        }else{
            imageView.image = [UIImage imageNamed:imageName];
        }
    }
}

- (void)createPageControl
{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_SHEIGHT - 80, SCREEN_SWIDTH, 30)];
    _pageControl.hidden = _pageControlShow;
    _pageControl.pageIndicatorTintColor = _pageIndicatorColor;
    _pageControl.currentPageIndicatorTintColor = _currentPageIndicatorColor;
    _pageControl.numberOfPages = self.imageArray.count;
    [self.view addSubview:_pageControl];
}

- (void)createCancelButton
{
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.layer.cornerRadius = 2;
    _cancelButton.hidden = _cancelButtonShow;
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _cancelButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    _cancelButton.frame = CGRectMake(SCREEN_SWIDTH - 70, NVA_HEIGHT, 60, 30);
    [_cancelButton setTitle:@"跳过" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelButton];
}
// 倒计时
- (void)startTimer
{
    __block NSInteger second = 10;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                [self->_cancelButton setTitle:[NSString stringWithFormat:@"%lds跳过",second] forState:UIControlStateNormal];
                second--;
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                [self->_cancelButton setTitle:@"跳过" forState:UIControlStateNormal];
                
                self.view.window.rootViewController = self->_rootController;
            }
        });
    });
    //启动源
    dispatch_resume(timer);
}

- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
}

- (void)setCancelButtonShow:(BOOL)cancelButtonShow
{
    _cancelButtonShow = cancelButtonShow;
    if (_cancelButtonShow){
          // 加载完毕开始倒计时
            [self startTimer];
      }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // pageControl 与 scrollView 联动
    CGFloat offsetWidth = scrollView.contentOffset.x;
    int pageNum = offsetWidth / [[UIScreen mainScreen] bounds].size.width;
    self.pageControl.currentPage = pageNum;
    if (scrollView.contentOffset.x >= scrollView.contentSize.width - SCREEN_SWIDTH + 40) {
        self.view.window.rootViewController =self->_rootController;
    }
}

- (void)showGuideViewWithImageArray:(NSArray *)imageArray WindowRootController:(UIViewController *)rootController
{
    _imageArray = imageArray;
    _rootController = rootController;
}

- (void)cancelButtonAction:(UIButton *)sender
{
    self.view.window.rootViewController = self->_rootController;
}
@end