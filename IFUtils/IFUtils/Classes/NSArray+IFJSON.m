//
//  NSArray+IFJSON.m
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "NSArray+IFJSON.h"

@implementation NSArray (IFJSON)



-(NSString*)toJsonString
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    
    if ([jsonData length] && error == nil){
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return nil;
    }
}


@end
