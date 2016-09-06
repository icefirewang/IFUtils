//
//  IFAppInfo.h
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @author icefire_wang, 16-05-16 14:05:33
 *
 *  返回 App 版本号
 *
 *  @return version
 */
NSString* if_appVersion();

/**
 *  @author icefire_wang, 16-05-16 14:05:52
 *
 *  获取App Build 号
 *
 *  @return build version
 */
NSUInteger if_appBuild();

@interface IFAppInfo : NSObject

@end
