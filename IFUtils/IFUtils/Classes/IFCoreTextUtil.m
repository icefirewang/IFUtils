//
//  CocoaTextUtil.m
//  Lemeng
//
//  Created by icefire_wang on 14-11-6.
//  Copyright (c) 2014年 Xiamen justit. All rights reserved.
//

#import "IFCoreTextUtil.h"

@implementation IFCoreTextUtil

#pragma mark - create Attribute Dictionary



// cocoa Text 设置 行距
+(void)setAttributeString:(NSMutableAttributedString*)string space:(CGFloat)space range:(NSRange)range
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}
// 设置 最小 高度
+(void)setAttributeString:(NSMutableAttributedString *)string lineHeight:(CGFloat)height range:(NSRange)range
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = height;
    paragraphStyle.maximumLineHeight = height;
    paragraphStyle.minimumLineHeight = height;
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
}
// cocoa Text 设置 颜色
+(void)setAttributeString:(NSMutableAttributedString*)string color:(UIColor*)color range:(NSRange)range
{
    [string addAttribute:NSForegroundColorAttributeName value:color range:range];
}

// cocoa Text 设置字体
+(void)setAttributeString:(NSMutableAttributedString*)string font:(UIFont*)font range:(NSRange)range
{
    NSAssert(string!=nil, @"string == nil !");
    NSAssert(font != nil, @"font == nil !");
    [string addAttribute:(NSString *)kCTFontAttributeName value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)font.fontName,font.pointSize,NULL)) range:range];
}
// // 添加下划线
+(void)setAttributeString:(NSMutableAttributedString *)string underLineWithColor:(UIColor *)color range:(NSRange)range
{
   
    NSAssert(color != nil, @"color == nil !!");
    [string addAttribute:(NSString*)kCTUnderlineStyleAttributeName value:@(1) range:range];
    //[string addAttribute:(NSString*)kCTUnderlineColorAttributeName value:(id)color range:range];
}

+(void)setAttributeString:(NSMutableAttributedString *)string backgroundColor:(UIColor *)color range:(NSRange)range
{
    NSAssert(color != nil, @"color == nil !!");
    [string addAttribute:(NSString*)NSBackgroundColorAttributeName value:(id)color range:range];
}

+(NSDictionary*)attributeWithColor:(UIColor*)color
                        lineHeight:(CGFloat)lineHeight
                              font:(UIFont*)font
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (color) {
        [dict setObject:color forKey:NSForegroundColorAttributeName];
    }
    if (font) {
        [dict setObject:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)font.fontName,font.pointSize,NULL)) forKey:(NSString *)kCTFontAttributeName];
    }
    if (lineHeight > 0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineHeightMultiple = lineHeight;
        paragraphStyle.maximumLineHeight = lineHeight;
        paragraphStyle.minimumLineHeight = lineHeight;
        [dict setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    NSDictionary *ret = [NSDictionary dictionaryWithDictionary:dict];
    dict = nil;
    return ret;
}

+(void)setAttributeString:(NSMutableAttributedString *)string  color:(UIColor*)color lineHeight:(CGFloat)height font:(UIFont*)font range:(NSRange)range
{
    NSDictionary *dict = [self attributeWithColor:color lineHeight:height font:font];
    [string setAttributes:dict range:range];
}

// 添加删除线
+(void)setAttributeString:(NSMutableAttributedString *)string withStrikeThroughColor:(UIColor*)color range:(NSRange)range
{
    [string addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:range];
    [string addAttribute:NSStrikethroughColorAttributeName value:(id)color range:range];
}

// 获取 文字 高度
+(CGFloat)getAttributedStringHeightWithString:(NSAttributedString *)  string  WidthValue:(CGFloat)width
{
    if (string.length == 0) {
        return 0;
    }
    
    CGFloat total_height = 0;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);    //string 为要计算高度的NSAttributedString
    CGRect drawingRect = CGRectMake(0, 0, width, 4000);  //这里的高要设置足够大
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    int line_y = (int) origins[[linesArray count] -1].y;  //最后一行line的原点y坐标
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (__bridge CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 4000 - line_y + (int) descent +1;    //+1为了纠正descent转换成int小数点后舍去的值
    
    CFRelease(textFrame);
    
    return total_height;
}


+(void)insertImage:(UIImage*)image bounds:(CGRect)bounds index:(NSUInteger)index toAttrString:(NSMutableAttributedString*)string
{
    if ([string isKindOfClass:[NSMutableAttributedString class]] == NO) {
        NSAssert(FALSE, @"no a NSMutableAttributedString");
        return;
    }
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.bounds = bounds;
    attch.image = image;
    NSAttributedString *toInsert = [NSAttributedString attributedStringWithAttachment:attch];
    [string insertAttributedString:toInsert atIndex:index];
}

+(NSAttributedString*)getHtmlAttributeString:(NSString*)string
{
    NSAttributedString *ret = [[NSAttributedString alloc] initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    return ret;
}

+(CGRect)rectOfAttributedString:(NSAttributedString *)string heightWithWidth:(CGFloat)width
{
    CGRect textRect = [string boundingRectWithSize:CGSizeMake(width-1, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return textRect;

}

+(CGFloat)sysGetAttributedString:(NSAttributedString *)string heightWithWidth:(CGFloat)width
{
    if (string.length == 0) {
        return 0;
    }
    CGRect textRect = [string boundingRectWithSize:CGSizeMake(width-2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return textRect.size.height;
    
}
@end
