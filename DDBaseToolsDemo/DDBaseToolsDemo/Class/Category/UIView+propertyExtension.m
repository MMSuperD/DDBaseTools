//
//   FileName:  UIView+propertyExtension.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/19
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "UIView+propertyExtension.h"
#import <objc/runtime.h>

@implementation UIView (propertyExtension)

const char * kCALL_BACK = "_kCALL_BACK";

#pragma --mark
#pragma --mark x,y,w,h,size,origin

- (CGSize)size {
    
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    
    CGRect tempFrame = self.frame;
    
    tempFrame.size = size;
    
    self.frame = tempFrame;
}

- (CGPoint)origin {
    
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect tempFrame = self.frame;
    
    tempFrame.origin = origin;
    
    self.frame = tempFrame;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect newfrmae = self.frame;
    newfrmae.size.width = width;
    self.frame = newfrmae;
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect newframe = self.frame;
    newframe.size.height = height;
    self.frame = newframe;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = x;
    self.frame = newFrame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect newframe = self.frame;
    newframe.origin.y = y;
    self.frame = newframe;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


#pragma --mark
#pragma --mark border

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)radius
{
    return self.layer.cornerRadius;
}

- (void)setRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = radius;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


#pragma --mark
#pragma --mark Remove all subviews

- (void)removeAllSubviews
{
    while ([self.subviews count]) {
        [[self.subviews lastObject] removeFromSuperview];
    }
}

- (void)onClick:(void (^)(void))callback
{
    if (callback) {
        self.userInteractionEnabled = YES;
        objc_setAssociatedObject(self, kCALL_BACK, callback, OBJC_ASSOCIATION_COPY);
        
        UITapGestureRecognizer *tap =[UITapGestureRecognizer new];
        [tap addTarget:self action:@selector(ClickHandler:)];
        [self addGestureRecognizer:tap];
    }
}

- (void)ClickHandler:(UITapGestureRecognizer *)recognizer
{
    void(^callback)(void) = objc_getAssociatedObject(self, kCALL_BACK);
    if (callback) {
        callback();
    }
}

@end
