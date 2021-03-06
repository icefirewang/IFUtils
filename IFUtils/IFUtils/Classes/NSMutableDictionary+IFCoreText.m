//
//  NSMutableDictionary+IFCoreText.h
//  IFUtils
//
//  Created by icefire_wang on 16/5/13.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "NSMutableDictionary+IFCoreText.h"

@implementation NSMutableDictionary (IFCoreText)


-(NSMutableDictionary* (^)(CGFloat height))if_coretextLineHeight
{
    return ^id(CGFloat height){
        
        if (height == 0) {
            NSAssert(FALSE, @"");
            return self;
        }
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineHeightMultiple = height;
        style.maximumLineHeight = height;
        style.minimumLineHeight = height;
        self[NSParagraphStyleAttributeName] = style;
        return self;
    };
}

-(NSMutableDictionary*(^)(UIColor *color))if_coretextColor
{
    return ^id(UIColor *color){
        if (color == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        self[NSForegroundColorAttributeName] = color;
        return self;
    };
}

-(NSMutableDictionary*(^)(UIFont *font))if_coretextFont
{
    return ^id(UIFont *font){
        if (font == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        self[NSFontAttributeName] = font;
        return self;
    };
}

-(NSMutableDictionary*(^)(UIColor *color))if_coretextBgColor
{
    return ^id(UIColor *color){
        if (color == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        self[NSBackgroundColorAttributeName] = color;
        return self;
    };
}

-(NSMutableDictionary*(^)(CGFloat offset))if_baselineOffset
{
    return ^id(CGFloat offset){
        self[NSBaselineOffsetAttributeName] = @(offset);
        return self;
    };
}



-(NSMutableDictionary*)if_coretextLineHeight:(CGFloat)height
{
    if (height == 0) {
        NSAssert(FALSE, @"");
        return self;
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineHeightMultiple = height;
    style.maximumLineHeight = height;
    style.minimumLineHeight = height;
    self[NSParagraphStyleAttributeName] = style;
    return self;
}



@end
