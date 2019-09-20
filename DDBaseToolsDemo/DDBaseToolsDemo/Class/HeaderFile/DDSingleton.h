//
//   FileName:  DDSingleton.h
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan(王丹)
//  Create:  2019/9/20
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#ifndef DDSingleton_h
#define DDSingleton_h

/**
 定义单例模式类    INTERFACE_SINGLETON(类名)
 实现单例模式类    IMPLEMENTATION_SINGLETON(类名)
 */
#undef    INTERFACE_SINGLETON
#define INTERFACE_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef    IMPLEMENTATION_SINGLETON
#define IMPLEMENTATION_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#endif /* DDSingleton_h */
