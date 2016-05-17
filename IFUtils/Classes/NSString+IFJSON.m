//
//  NSString+IFJSON.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "NSString+IFJSON.h"

@implementation NSString (IFJSON)

-(id)toJsonObject
{
    NSError *error = nil;
    id JSON =
    [NSJSONSerialization JSONObjectWithData: [self dataUsingEncoding:NSUTF8StringEncoding]
                                    options: NSJSONReadingMutableContainers | NSJSONReadingAllowFragments
                                      error: &error];
    return JSON;
}




@end
