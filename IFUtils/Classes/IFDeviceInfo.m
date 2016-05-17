//
//  IFDeviceInfo.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "IFDeviceInfo.h"
#import <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

#import <AdSupport/AdSupport.h>

CGFloat if_iOSVersion()
{
    static float iosVersion = 0.0f;
    if (iosVersion == 0.0f) {
        iosVersion = [[UIDevice currentDevice] systemVersion].floatValue;
    }
    return iosVersion;
}

/**
 *  @author 王健, 16-05-16 14:05:21
 *
 *  设备型号
 *
 *  @return 设备 对应的编码  4S -> iphone6 , 5->iphone7...  具体网上查找
 */
NSString * if_deviceMode()
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;

}

/**
 *  @author 王健, 16-05-16 14:05:52
 *
 *  设备屏幕类型
 *
 *  @return
 */
DeviceScreenType if_deviceScreenType()
{
    static NSInteger type = -1;
    if (type != -1) {
        return type;
    }
    //CGSize size = [[UIScreen mainScreen] bounds].size;
    CGSize size = [[[UIScreen mainScreen] currentMode] size];
    if (size.height < size.width) {
        CGFloat  h = size.height;
        size.height = size.width;
        size.width = h;
    }
    // 4
    if (CGSizeEqualToSize(size, CGSizeMake(320*2, 480*2))) {
        type = kDeviceScreenType_4;
    }else
        // 5
        if (CGSizeEqualToSize(size, CGSizeMake(320*2, 568*2))) {
            type = kDeviceScreenType_5;
        }else
            // 6
        if (CGSizeEqualToSize(size, CGSizeMake(750, 1334))) {
            type = kDeviceScreenType_6;
        }else
        // 6p 放大模式
        if (CGSizeEqualToSize(size, CGSizeMake(1125, 2001))) {
            type = kDeviceScreenType_6p_zoom;
        }else
        // 6p 普通模式
        if (CGSizeEqualToSize(size, CGSizeMake(1242, 2208))) {
            type = kDeviceScreenType_6p_normal;
        }
        // 未知 默认5
        else{
            type = kDeviceScreenType_5;
        }
    
    return type;
    
}

@implementation IFDeviceInfo

@end
