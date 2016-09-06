//
//  CheckUtil.h
//  KKCartoon
//
//  Created by icefire_wang on 15/2/18.
//  Copyright (c) 2015年 icefire_wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IFCheckUtil : NSObject

+(BOOL)isValidPhoneNum:(NSString*)phone;
+(BOOL)isValidMailAddress:(NSString*)mail;
+(BOOL)isValidPassword:(NSString*)password;
+(BOOL)isValidSMSCode:(NSString*)code;
+(BOOL)isValidHttpAddress:(NSString*)url;

@end
