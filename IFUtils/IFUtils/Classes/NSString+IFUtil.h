//
//  NSString+IFNetUtil.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IFUtil)

/**
 *  @author 王健, 16-01-18 08:01:06
 *
 *  去除头尾空格 及换行
 *
 *  @return new  String
 */
-(NSString*)if_trimSpace;

/**
 *  @author 王健, 16-05-16 14:05:13
 *
 *  是否包含某个字符串 适配IOS7 用
 *
 *  @param str 查找字符串
 *
 *  @return
 */
-(BOOL)containsString:(NSString *)str;


/**
 *  @author 王健, 16-05-16 14:05:32
 *
 *  将其它文字转换为 英文拼音，英文保持不变
 *
 *  @return 
 */
-(NSString*)if_toPinyin;

/**
 *  @author 王健, 16-05-16 14:05:46
 *
 *  网址编码
 *
 *  @param encoding
 *
 *  @return
 */
-(NSString *)if_urlEncodeUsingEncoding:(NSStringEncoding)encoding;

@end
