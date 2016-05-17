//
//  IFAppInfo.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author 王健, 16-05-16 14:05:33
 *
 *  返回 App 版本号
 *
 *  @return version
 */
NSString* if_appVersion();

/**
 *  @author 王健, 16-05-16 14:05:52
 *
 *  获取App Build 号
 *
 *  @return build version
 */
NSUInteger if_appBuild();

@interface IFAppInfo : NSObject

@end
