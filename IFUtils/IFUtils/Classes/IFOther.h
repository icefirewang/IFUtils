//
//  IFOther.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author 王健, 16-05-16 14:05:21
 *
 *  浮点数是否含有小数位
 *
 *  @param num
 *
 *  @return
 */
BOOL if_isFloatHasDecimal(double num);

/**
 *  @author 王健, 16-05-16 14:05:50
 *
 *  创建一个 UUID
 *
 *  @return 新的UUID
 */
NSString * if_createUUID();



/**
 *  @author 王健, 16-05-16 15:05:12
 *
 *  获取 缓存路径
 *
 *  @return 路径
 */
NSString * if_cachePath();


/**
 *  @author 王健, 16-05-16 15:05:56
 *
 *
 *
 *  @return 路径
 */
NSString * if_libraryPath();

/**
 *  @author 王健, 16-05-16 15:05:56
 *
 *
 *
 *  @return 路径
 */
NSString * if_documentPath();


NSString * if_showAlert(NSString* message,...);

@interface IFOther : NSObject

@end
