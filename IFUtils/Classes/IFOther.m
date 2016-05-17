//
//  IFOther.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "IFOther.h"

/**
 *  @author 王健, 16-05-16 14:05:21
 *
 *  浮点数是否含有小数位
 *
 *  @param num
 *
 *  @return
 */
BOOL if_isFloatHasDecimal(double num)
{
    long long integer = num;
    if (num - integer > 0 ) {
        return YES;
    }else{
        return NO;
    }
}


/**
 *  @author 王健, 16-05-16 14:05:50
 *
 *  创建一个 UUID
 *
 *  @return 新的UUID
 */
NSString * if_createUUID()
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    
    return uuidString;
}


/**
 *  @author 王健, 16-05-16 15:05:12
 *
 *  获取 缓存路径
 *
 *  @return 路径
 */
NSString * if_cachePath()
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* ret = [paths[0] stringByAppendingString:@"/"];
    return ret;
}


/**
 *  @author 王健, 16-05-16 15:05:56
 *
 *
 *
 *  @return 路径
 */
NSString * if_libraryPath()
{
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    NSString* ret = [path stringByAppendingString:@"/"];
    return ret;
}


/**
 *  @author 王健, 16-05-16 15:05:56
 *
 *
 *
 *  @return 路径
 */
NSString * if_documentPath()
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString* ret = [path stringByAppendingString:@"/"];
    return ret;
    
}



@implementation IFOther

@end
