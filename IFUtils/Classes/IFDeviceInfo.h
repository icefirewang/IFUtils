//
//  IFDeviceInfo.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,DeviceScreenType){
    kDeviceScreenType_4,
    kDeviceScreenType_5,
    kDeviceScreenType_6,
    kDeviceScreenType_6p_zoom,
    kDeviceScreenType_6p_normal
};

/**
 *  @author 王健, 16-05-16 14:05:11
 *
 *  iOS 版本
 *
 *  @return 版本号
 */
CGFloat if_iOSVersion();

/**
 *  @author 王健, 16-05-16 14:05:21
 *
 *  设备型号
 *
 *  @return 设备 对应的编码  4S -> iphone6 , 5->iphone7...
 */
NSString * if_deviceMode();


/**
 *  @author 王健, 16-05-16 14:05:52
 *
 *  设备屏幕类型
 *
 *  @return
 */
DeviceScreenType if_deviceScreenType();

@interface IFDeviceInfo : NSObject

@end
