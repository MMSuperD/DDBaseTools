//
//   FileName:  NSObject+hook.m
//   ProjectName:  WX
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/12/19
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "NSObject+hook.h"
#import <objc/runtime.h>


@implementation NSObject (hook)

+ (void)hookClass:(Class)classObject originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    
    // afn 版本的
    //   [self afn_hookClass:classObject originalSelector:originalSelector swizzledSelector:swizzledSelector];
    
    // 通俗易懂的版本
    [self my_hookClass:classObject originalSelector:originalSelector swizzledSelector:swizzledSelector];
}

#pragma <AFN 版本的Hook 方法>
+ (void)afn_hookClass:(Class)classObject originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    // 这个是AFN 版本的
    Class class = classObject;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    if(class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma <通俗易懂的Hook 方法>
+ (void)my_hookClass:(Class)classObject originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    
    // 这个是通俗易懂的版本
    
    Class class = classObject;
    //如果本类中有 originalSelector 方法，直接交换。
    //如果本类中没有 originalSelector 方法，添加父类的的方法到子类，然后再直接交换。
    
    // 这两行与以前没有任何变化
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    //class_addMethod 添加的SEL是 originalSelector ，IMP 是 method_getImplementation(originalMethod)，我称他们为原配，
    //如果本类中，已经有 originalSelector，再添加 originalSelector， 肯定返回NO，添加失败，那就直接交换了，跟第一版hook流程一模一样了,
    //如果本类中，没有此SEL，那就会去父类里找，返回的就是父类里的信息，然后将父类的信息，添加到本类中，就相当于，本类完全的继承了父类的方法，
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    if (didAddMethod) {
        //添加成功后，本类中，已经有一个originalSelector方法了
        //我们第一次获得originalMethod是返回父类的originalMethod
        //我们需要再重新获得一下originalMethod，这次返回的不是父类的originalMethod
        //而是我们刚刚class_addMethod添加的到本类的originalMethod
        
        originalMethod = class_getInstanceMethod(class, originalSelector);
    }
    
    //走到这，就证明了，本类中肯定已经有这两个方法了，那就这样直接交换吧。
    method_exchangeImplementations(swizzledMethod, originalMethod);
    
}

@end
