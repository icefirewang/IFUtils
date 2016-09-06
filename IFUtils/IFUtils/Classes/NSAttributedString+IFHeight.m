//
//  NSAttributedString+IFHeight.m
//  IFUtils
//
//  Created by icefire_wang on 16/9/5.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "NSAttributedString+IFHeight.h"

@implementation NSAttributedString (IFHeight)

-(CGFloat)heightInWidth:(CGFloat)width
{
    
    if (width == 0) {
        NSAssert(FALSE, @"");
        return 0;
    }
    if (self.length == 0) {
        return 0;
    }
    
    // 如果 有设置 全部的 baseline offset 则 加上
    NSRange range = NSMakeRange(0, self.length);
    NSRangePointer p = &range;
    NSDictionary<NSString *, id> *attributes = [self attributesAtIndex:0 effectiveRange:p];
    NSNumber *baselineOffset = [attributes objectForKey:NSBaselineOffsetAttributeName];
    CGFloat offset = baselineOffset?baselineOffset.floatValue:0;
    
    // 计算文字高度
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, CGFLOAT_MAX)];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [layoutManager addTextContainer:textContainer];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager glyphRangeForTextContainer:textContainer];
    CGSize size =  [layoutManager
                    usedRectForTextContainer:textContainer].size;
    CGFloat ret = size.height;
    
    ret += fabs(offset);
    return ret;
    
    
//    CGRect textRect = [self boundingRectWithSize:CGSizeMake(width-1, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesDeviceMetrics context:nil];
//    return textRect.size.height;
    
}

@end
