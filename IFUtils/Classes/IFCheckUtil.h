//
//  CheckUtil.h
//  KKCartoon
//
//  Created by wangjian on 15/2/18.
//  Copyright (c) 2015年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IFCheckUtil : NSObject

+(BOOL)isValidPhoneNum:(NSString*)phone;
+(BOOL)isValidMailAddress:(NSString*)mail;
+(BOOL)isValidPassword:(NSString*)password;
+(BOOL)isValidSMSCode:(NSString*)code;
+(BOOL)isValidHttpAddress:(NSString*)url;

@end
