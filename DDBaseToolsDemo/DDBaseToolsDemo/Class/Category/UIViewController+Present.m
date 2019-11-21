//
//   FileName:  UIViewController+Present.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/11/21
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "UIViewController+Present.h"
#import <objc/runtime.h>
#import <StoreKit/StoreKit.h>
#import <SafariServices/SafariServices.h>

@implementation UIViewController (Present)


+ (void)changeOriginalSEL:(SEL)orignalSEL swizzledSEL:(SEL)swizzledSEL {
    Method originalMethod = class_getInstanceMethod([self class], orignalSEL);
    Method swizzledMethod = class_getInstanceMethod([self class], swizzledSEL);
    if (class_addMethod([self class], orignalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod([self class], swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSEL = @selector(presentViewController:animated:completion:);
        SEL swizzledSEL = @selector(ddy_PresentViewController:animated:completion:);
        [self changeOriginalSEL:originalSEL swizzledSEL:swizzledSEL];
    });
}

- (void)ddy_PresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (viewControllerToPresent.ddy_AutoSetModalPresentationStyle) {
            
            if ([viewControllerToPresent isKindOfClass:NSClassFromString(@"XTApplyAgreementViewController")]) {
                 viewControllerToPresent.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            } else {
                viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
            }
            
        }
    }
    [self ddy_PresentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)setDdy_AutoSetModalPresentationStyle:(BOOL)ddy_AutoSetModalPresentationStyle {
    objc_setAssociatedObject(self, @selector(ddy_AutoSetModalPresentationStyle), @(ddy_AutoSetModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ddy_AutoSetModalPresentationStyle {
    NSNumber *obj = objc_getAssociatedObject(self, @selector(ddy_AutoSetModalPresentationStyle));
    return obj ? [obj boolValue] : [self.class ddy_GlobalAutoSetModalPresentationStyle];
}

// MARK: 排除一些系统控制器
+ (BOOL)ddy_GlobalAutoSetModalPresentationStyle {
    if ([self isKindOfClass:[UIImagePickerController class]]) {
        return NO;
    } else if ([self isKindOfClass:[UIAlertController class]]) {
        return NO;
    } else if ([self isKindOfClass:[UIActivityViewController class]]) {
        return NO;
    } else if ([self isKindOfClass:[UIDocumentInteractionController class]]) {
        return NO;
    } else if ([self isKindOfClass:[SFSafariViewController class]]) {
           return NO;
    }
#ifdef __IPHONE_10_3
    else if (@available(iOS 10.3, *)) {
        if ([self isKindOfClass:[SKStoreReviewController class]]) {
            return NO;
        } else if ([self isKindOfClass:[SKStoreProductViewController class]]) {
            return NO;
        }
    } else {
        // Fallback on earlier versions
    }
#endif
    return YES;
}

@end
