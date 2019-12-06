//
//   FileName:  UIView+propertyExtension.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/19
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import <UIKit/UIKit.h>

// View 圆角和加边框
#define VIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define VIEW_RADIUS(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

NS_ASSUME_NONNULL_BEGIN

@interface UIView (propertyExtension)

/**
 * @brief 位置
 */
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

/**
 * @brief 边框颜色
 */
@property (nonatomic, strong) UIColor * borderColor;
/**
 * @brief 边框宽度
 */
@property (nonatomic, assign) CGFloat   borderWidth;
/**
 * @brief 园角
 */
@property (nonatomic, assign) CGFloat   radius;

- (UIViewController *)viewController;


/**
 *@brief 返回尺寸
 */
- (CGSize)size;


/**
 * @brief 设置尺寸
 */
- (void)setSize:(CGSize)size;


/**
 * @brief 返回起点
 */
- (CGPoint)origin;


/**
 * @brief 设置起点
 */
- (void)setOrigin:(CGPoint)origin;

/**
 * @brief 删除所有子试图
 */
- (void)removeAllSubviews;

/**
 * @brief 添加点击事件
 */
- (void)onClick:(void(^)(void))callback;

@end

NS_ASSUME_NONNULL_END
