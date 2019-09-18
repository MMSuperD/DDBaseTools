//
//   FileName:  UIFont+adaptive.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/18
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "UIFont+adaptive.h"
#import "objc/runtime.h"

@implementation UIFont (adaptive)

+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width * 1.0/375];
    return newFont;
}

@end

@implementation UILabel (adaptive)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)adapterInitWithCoder:(NSCoder *)aDecoder {
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
    
    return self;
}

@end

@implementation UITextField (adaptive)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)adapterInitWithCoder:(NSCoder *)aDecoder {
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
    
    return self;
}

@end

@implementation UIButton (adaptive)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)adapterInitWithCoder:(NSCoder *)aDecoder {
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:self.titleLabel.font.pointSize];
    }
    return self;
}

@end

@implementation UITextView (adaptive)

+ (void)load {
    
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)adapterInitWithCoder:(NSCoder *)aDecoder {
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
    
    return self;
}

@end


