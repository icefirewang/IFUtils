//
//  CheckUtil.m
//  KKCartoon
//
//  Created by icefire_wang on 15/2/18.
//  Copyright (c) 2015年 icefire_wang. All rights reserved.
//

#import "IFCheckUtil.h"

@implementation IFCheckUtil

+(BOOL)isValidPhoneNum:(NSString*)phone
{
//    NSString *mobileRegex = @"1[0-9]{10}";
     NSString *mobileRegex = @"^1\\d{10}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [mobileTest evaluateWithObject:phone];

}
+(BOOL)isValidMailAddress:(NSString*)mail
{
    if (mail.length >100) {
        return NO;
    }
    //NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *emailRegex = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
}

+(BOOL)isValidPassword:(NSString*)password
{
    NSString *passwordRegex = @"^.{6,30}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:password];

}

+(BOOL)isValidSMSCode:(NSString*)code
{
    if (code.length == 6) {
        return YES;
    }
    return NO;
}


+(BOOL)isValidHttpAddress:(NSString*)url
{
    NSString *httpRegex = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    NSPredicate *httpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", httpRegex];
    return [httpTest evaluateWithObject:url];

}
@end
