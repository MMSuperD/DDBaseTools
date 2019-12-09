//
//  ViewController.m
//  Xinedai
//
//  Created by RanWang on 2017/5/15.
//  Copyright © 2017年 RanWang. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "XTBaseNavigationController.h"
@interface MainTabBarViewController ()
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;
    //    self.delegate = self;
    //设置tabbar背景白色
    UIView *view = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] insertSubview:view atIndex:0];
    //移除顶部线条
    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    //添加阴影
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -2);
    self.tabBar.layer.shadowOpacity = 0.1;
    
    //设置tabbaritem属性
    NSDictionary *normalAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"999999"], NSForegroundColorAttributeName, nil];
    NSDictionary *selectedAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"EE4032"], NSForegroundColorAttributeName, nil];
    self.viewControllers = @[
        [self addChildVC:@"NineHomeViewController" title:@"首页" selectImageName:@"borrow money_selected_icon" imageName:@"borrow money_icon" normalAttributes:normalAttributes selectAttributes:selectedAttributes],
        [self addChildVC:@"XTMineViewController" title:@"我的" selectImageName:@"mine_selected_icon" imageName:@"mine_icon" normalAttributes:normalAttributes selectAttributes:selectedAttributes]
    ];
    // 解决IOS tabbar 颜色跳动
    self.tabBar.unselectedItemTintColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (XTBaseNavigationController *)addChildVC:(NSString *)vcName title:(NSString *)title selectImageName:(NSString *)selectImageName imageName:(NSString *)imageName normalAttributes:(NSDictionary *)normalAttributes selectAttributes:(NSDictionary *)selectAttributes {
    
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    vc.title = title;
    UITabBarItem *mineItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mineItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [mineItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
    vc.tabBarItem = mineItem;
    XTBaseNavigationController *nv = [[XTBaseNavigationController alloc] initWithRootViewController:vc];
    return nv;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
