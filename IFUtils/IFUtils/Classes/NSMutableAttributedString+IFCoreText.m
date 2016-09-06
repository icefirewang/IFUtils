//
//  NSMutableAttributedString+IFCoreText.m
//  IFUtils
//
//  Created by icefire_wang on 16/5/13.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "NSMutableAttributedString+IFCoreText.h"
#import "MethodSwizzle.h"
#import <objc/runtime.h>


static const NSString *kAttributeName = @"AttributeName";
static const NSString *kAttribteRange = @"AttributeRange";
static const NSString *kAttributeValue = @"AttributeValue";

static char key_attributeArray;

@interface NSMutableAttributedString ()


@property (nonatomic,strong) NSMutableArray *attributes;

@end


@implementation NSMutableAttributedString (IFCoreText)


-(NSMutableArray*)attributes
{
    id ret = objc_getAssociatedObject(self, &key_attributeArray);
    if (ret == nil) {
        NSMutableArray *dict = [[NSMutableArray alloc] init];
        objc_setAssociatedObject(self, &key_attributeArray, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        ret = dict;
    }
    return ret;
}


-(NSMutableAttributedString*(^)(void))if_endAttributeSet
{
    return ^id(void){
              
        [self.attributes sortUsingComparator:^NSComparisonResult(NSDictionary * _Nonnull obj1, NSDictionary *  _Nonnull obj2) {
            
            NSString *key1 = [obj1 objectForKey:kAttributeName];
            NSString *key2 = [obj2 objectForKey:kAttributeName];
            
            // 如果先设置了 BackgroundColor 再设置 Baseline offset  back ground color 会无效
            if ([key1 isEqualToString:NSBackgroundColorAttributeName] && [key2 isEqualToString:NSBaselineOffsetAttributeName]) {
                return NSOrderedDescending;
            }else{
                return NSOrderedSame;
            }
        }];
        
        [self.attributes enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSRange range = [[dict objectForKey:kAttribteRange] rangeValue];
            id value = [dict objectForKey:kAttributeValue];
            NSString *name = [dict objectForKey:kAttributeName];
            NSDictionary *att = @{name:value};
            [self setAttributes:att range:range];
            
        }];
        
        return self;
    };
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
        
        NSDictionary *attribute = @{
                                     kAttributeName : NSParagraphStyleAttributeName,
                                     kAttribteRange : [NSValue valueWithRange:range],
                                     kAttributeValue :@(height)
                                     };
        [self.attributes addObject:attribute];
        //[self addAttribute:NSParagraphStyleAttributeName value:style range:range];
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
        NSDictionary *attribute = @{
                                    kAttributeName : NSForegroundColorAttributeName,
                                    kAttribteRange : [NSValue valueWithRange:range],
                                    kAttributeValue :color
                                    };
        [self.attributes addObject:attribute];
       // [self addAttribute:NSForegroundColorAttributeName value:color range:range];
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
        NSDictionary *attribute = @{
                                    kAttributeName : NSForegroundColorAttributeName,
                                    kAttribteRange : [NSValue valueWithRange:range],
                                    kAttributeValue :font
                                    };
        [self.attributes addObject:attribute];
        //[self addAttribute:NSFontAttributeName value:font range:range];
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
        NSDictionary *attribute = @{
                                    kAttributeName : NSBackgroundColorAttributeName,
                                    kAttribteRange : [NSValue valueWithRange:range],
                                    kAttributeValue :color
                                    };
        [self.attributes addObject:attribute];
        //[self addAttribute:NSBackgroundColorAttributeName value:color range:range];
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


-(NSMutableAttributedString*(^)(CGFloat offset,NSRange range))if_setBaselineOffset
{
    return ^id(CGFloat offset,NSRange range){
        
        NSDictionary *attribute = @{
                                    kAttributeName : NSBaselineOffsetAttributeName,
                                    kAttribteRange : [NSValue valueWithRange:range],
                                    kAttributeValue :@(offset)
                                    };
        [self.attributes addObject:attribute];
        
      //  NSDictionary *attribute = @{NSBaselineOffsetAttributeName:@(offset)};
        [self setAttributes:attribute range:range];

        return self;
    };
}

-(CGFloat (^)(CGFloat width))if_getHeightInWidth
{
    
    
    return ^CGFloat(CGFloat width){
        if (width == 0) {
            NSAssert(FALSE, @"");
            return 0;
        }
        if (self.length == 0) {
            return 0;
        }
        NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self];
        NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(width, CGFLOAT_MAX)];
        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
        [layoutManager addTextContainer:textContainer];
        [textStorage addLayoutManager:layoutManager];
        [layoutManager glyphRangeForTextContainer:textContainer];
        CGSize size =  [layoutManager
                        usedRectForTextContainer:textContainer].size;
        return size.height;
        
        
    };

    
//    return ^CGFloat(CGFloat width){
//        if (width == 0) {
//            NSAssert(FALSE, @"");
//            return 0;
//        }
//        if (self.length == 0) {
//            return 0;
//        }
//        
//        
//        CGRect textRect = [self boundingRectWithSize:CGSizeMake(width-1, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesDeviceMetrics context:nil];
//        return textRect.size.height;
//
//    };
}


@end
