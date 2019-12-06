//
//   FileName:  AppQuickWay.h
//   ProjectName:  NFONTAS
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/8/21
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#ifndef AppQuickWay_h
#define AppQuickWay_h

#define HScale(number) ((SHEIGHT - NVA_HEIGHT) * 1.0/(667 - 64) * (number))
#define WScale(number) ((SCREEN_SWIDTH) * 1.0/(375) * (number))
#define I(imageName) [UIImage imageNamed:(imageName)]
#define MJHeaderEndRefresh [[ViewTools sharedInstance].currentTableView.mj_header endRefreshing];
#define MJFooterEndRefresh [[ViewTools sharedInstance].currentTableView.mj_footer endRefreshing];


#endif /* AppQuickWay_h */
