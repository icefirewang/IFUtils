//
//  NSMutableAttributedString+IFCoreText.m
//  IFUtils
//
//  Created by wangjian on 16/5/13.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "NSMutableAttributedString+IFCoreText.h"
#import "MethodSwizzle.h"
@implementation NSMutableAttributedString (IFCoreText)




-(instancetype)initWithString_if:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs
{
    self = [self initWithString_if:str attributes:attrs];
    return self;
}


-(instancetype)initWithString_if:(NSString *)str
{
    self = [self initWithString_if:str];
    return self;
}


-(NSMutableAttributedString* (^)(CGFloat height,NSRange range))if_setLineHeight
{
    return ^id(CGFloat height,NSRange range){
        
        if (height == 0) {
            NSAssert(FALSE, @"");
            return self;
        }
        if (range.length + range.location > self.length) {
            NSAssert(FALSE, @"");
            return self;
        }
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineHeightMultiple = height;
        style.maximumLineHeight = height;
        style.minimumLineHeight = height;
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
        return self;
    };
}

-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setTextColor
{
    return ^id(UIColor *color,NSRange range){
        if (color == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        if (range.length + range.location > self.length) {
            NSAssert(FALSE, @"");
            return self;
        }
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
        return self;
    };
}

-(NSMutableAttributedString*(^)(UIFont *font,NSRange range))if_setTextFont
{
    return ^id(UIFont *font,NSRange range){
        if (font == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        if (range.length + range.location > self.length) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        [self addAttribute:NSFontAttributeName value:font range:range];
        return self;
    };
}

-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setBackgroundColor
{
    
    return ^id(UIColor *color,NSRange range){
        if (color == nil) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        if (range.length + range.location > self.length) {
            NSAssert(FALSE, @"");
            return self;
        }
        
        [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
        return self;
    };
}


-(void(^)(UIImage *image,CGRect bounds,NSUInteger index))if_insertImage
{
    return ^void(UIImage *image,CGRect bounds,NSUInteger index){
        if (image == nil) {
            NSAssert(FALSE, @"");
            return ;
        }
        
        if (index>self.length) {
            NSAssert(FALSE, @"");
            return ;
        }
        
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        CGRect resetBounds = CGRectMake(-bounds.origin.x, -bounds.origin.y, bounds.size.width, bounds.size.height);
        attch.bounds = resetBounds;
        attch.image = image;
        NSAttributedString *toInsert = [NSAttributedString attributedStringWithAttachment:attch];
        [self insertAttributedString:toInsert atIndex:index];
    };
}


-(CGFloat (^)(CGFloat width))if_getHeightInWidth
{
    
    
//    return ^CGFloat(CGFloat width){
//        if (width == 0) {
//            NSAssert(FALSE, @"");
//            return 0;
//        }
//        if (self.length == 0) {
//            return 0;
//        }
//        NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self];
//        NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, CGFLOAT_MAX)];
//        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
//        [layoutManager addTextContainer:textContainer];
//        [textStorage addLayoutManager:layoutManager];
//        [layoutManager glyphRangeForTextContainer:textContainer];
//        CGSize size =  [layoutManager
//                        usedRectForTextContainer:textContainer].size;
//        return size.height;
//        
//        
//    };

    
    return ^CGFloat(CGFloat width){
        if (width == 0) {
            NSAssert(FALSE, @"");
            return 0;
        }
        if (self.length == 0) {
            return 0;
        }
        
        
        CGRect textRect = [self boundingRectWithSize:CGSizeMake(width-1, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesDeviceMetrics context:nil];
        return textRect.size.height;

    };
}


@end
