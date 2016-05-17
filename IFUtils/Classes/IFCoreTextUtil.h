//
//  CocoaTextUtil.h
//  Lemeng
//
//  Created by wangjian on 14-11-6.
//  Copyright (c) 2014年 Xiamen justit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface IFCoreTextUtil : NSObject

// core Text 设置 行距
+(void)setAttributeString:(NSMutableAttributedString*)string space:(CGFloat)space range:(NSRange)range;
// core Text 设置 颜色
+(void)setAttributeString:(NSMutableAttributedString*)string color:(UIColor*)color range:(NSRange)range;
// core Text 设置字体
+(void)setAttributeString:(NSMutableAttributedString*)string font:(UIFont*)font range:(NSRange)range;
// // 添加下划线
+(void)setAttributeString:(NSMutableAttributedString *)string underLineWithColor:(UIColor *)color range:(NSRange)range;
// 背景色
+(void)setAttributeString:(NSMutableAttributedString *)string backgroundColor:(UIColor *)color range:(NSRange)range;
// core Text 行高
+(void)setAttributeString:(NSMutableAttributedString *)string lineHeight:(CGFloat)height range:(NSRange)range;


/**
 *  @author 王健, 16-04-22 16:04:20
 *
 *  创建一个 coredata 属性 字典
 *
 *  @param color
 *  @param lineHeight
 *  @param font
 *
 *  @return 属性字典
 */
+(NSDictionary*)attributeWithColor:(UIColor*)color
                        lineHeight:(CGFloat)lineHeight
                              font:(UIFont*)font;
// 常用属性
+(void)setAttributeString:(NSMutableAttributedString *)string  color:(UIColor*)color lineHeight:(CGFloat)height font:(UIFont*)font range:(NSRange)range;

// 添加删除线
+(void)setAttributeString:(NSMutableAttributedString *)string withStrikeThroughColor:(UIColor*)color range:(NSRange)range;

// 获取 文字 高度
+(CGFloat)getAttributedStringHeightWithString:(NSAttributedString *)string  WidthValue:(CGFloat)width;



+(void)insertImage:(UIImage*)image bounds:(CGRect)bounds index:(NSUInteger)index toAttrString:(NSMutableAttributedString*)string;


/**
 *  HTML 格式 转换成 attributeString
 *
 *  @param string string
 *
 *  @return NSAttributedString
 */
+(NSAttributedString*)getHtmlAttributeString:(NSString*)string;

/**
 *  系统方法获取 attributed string 大小
 *
 *  @param string the string
 *  @param width  宽度
 *
 *  @return 返回 rect
 */
+(CGRect)rectOfAttributedString:(NSAttributedString *)string heightWithWidth:(CGFloat)width;
/**
 *  系统方法获取 attributed string 高度
 *
 *  @param string the string
 *  @param width  宽度
 *
 *  @return 返回高度
 */
+(CGFloat)sysGetAttributedString:(NSAttributedString *)string heightWithWidth:(CGFloat)width;
@end
