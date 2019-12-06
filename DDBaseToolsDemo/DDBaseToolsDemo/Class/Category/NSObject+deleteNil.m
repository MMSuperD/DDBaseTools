//
//   FileName:  NSObject+deleteNil.m
//   ProjectName:  DDBaseToolsDemo
//  Organization:  Copyright (c) Hello Technologies Co., Ltd. ____YEAR___. All rights reserves.
//
//  Description:
//  Author:  Fan
//  Create:  2019/11/25
//  CompanyName:  通华金科
//  This head path is “~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist”

#import "NSObject+deleteNil.h"

@implementation NSObject (deleteNil)

// 除空数据 NSDictionary NSArray
- (id)deleteNil:(id)data {
    id tempData = nil;
    if ([data isKindOfClass:[NSDictionary class]]) {
        tempData = [self dealDict:data];
    } else if ([data isKindOfClass:[NSArray class]]) {
        tempData = [self dealArray:data];
    }
    return tempData;
}

- (NSMutableDictionary *)dealDict:(NSDictionary *)params {
    
    if (!params) {
           return nil;
       }
       NSMutableDictionary *mutaleDic = [NSMutableDictionary dictionary];
       for (NSString *keyStr in params.allKeys) {
//           NSLog(@"++++++%@",[keyStr description]);
           if ([[params objectForKey:keyStr] isEqual:[NSNull null]] || [[params objectForKey:keyStr] isKindOfClass:[NSNull class]]) {
               continue;
           } else if ([[params objectForKey:keyStr] isKindOfClass:[NSDictionary class]]) {
               if ([self dealDict:[params objectForKey:keyStr]].count) {
                   [mutaleDic setObject:[self dealDict:[params objectForKey:keyStr]] forKey:keyStr];
               }
               
           } else if ([[params objectForKey:keyStr] isKindOfClass:[NSArray class]]) {
               if ([self dealArray:[params objectForKey:keyStr]]) {
                   [mutaleDic setObject:[self dealArray:[params objectForKey:keyStr]] forKey:keyStr];
               }
           }
           else{
               [mutaleDic setObject:[[params objectForKey:keyStr] description] forKey:keyStr];
           }
       }
       return mutaleDic.copy;
}

- (NSArray *)dealArray:(NSArray *)array {
    if (array.count == 0) {
        return nil;
    }
    NSMutableArray *mulArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [mulArray addObject:[self dealDict:dict]];
    }
    return mulArray.copy;
}

@end
