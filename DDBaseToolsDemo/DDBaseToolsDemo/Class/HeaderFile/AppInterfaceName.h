//
//   FileName:  AppInterfaceName.h
//   ProjectName:  NFONTAS
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/8/21
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#ifndef AppInterfaceName_h
#define AppInterfaceName_h

#pragma mark - 是否为生产环境 0表示测试环境，1表示生产环境

#define IS_PRODUCTION_RELEASE 0

#pragma mark - -------------------定位服务器URL地址------------------------

// 服务器地址URL
#if IS_PRODUCTION_RELEASE == 0
    #define HostURL @"http://openapi.allinpaycard.cn/" //   dev
    #define XTResourceServerURL   @"http://filegateway.allinpaycard.cn/upload"
    #define BTHostURL @"http://openapi.allinpaycard.cn/"

#else
    #define HostURL @"https://xtsh-api.ulinkcredit.com/" // release
    #define FileURL @"http://file-95193.allinpaycard.com"//release
    #define XTResourceServerURL   @"http://xtsh-file.ulinkcredit.com/upload"
    #define BTHostURL @"https://openapi.allinpaycard.com/"
#endif

#define Interface(URL_NAME)             ([NSString stringWithFormat:@"%@%@",HostURL,(URL_NAME)])
#define InterfaceAPI(URL_NAME)             ([NSString stringWithFormat:@"%@allinpay.xtsh.api/%@",HostURL,(URL_NAME)])


#pragma mark - -------------------用户信息接口------------------------



#endif /* AppInterfaceName_h */
