//
//  IFAppInfo.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "IFAppInfo.h"


NSString* if_appVersion()
{
    static NSString* version = 0;
    if (version == 0) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    }
    return version;
}

NSUInteger if_appBuild()
{
    static NSInteger versionBuild = 0;
    if (versionBuild == 0) {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        versionBuild = [[infoDictionary objectForKey:@"CFBundleVersion"] integerValue];
    }
    return versionBuild;
}

@implementation IFAppInfo

@end
