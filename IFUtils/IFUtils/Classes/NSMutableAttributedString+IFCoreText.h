//
//  NSMutableAttributedString+IFCoreText.h
//  IFUtils
//
//  Created by wangjian on 16/5/13.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (IFCoreText)


/**
 *  @author icefire_wang, 16-09-05 16:09:40
 *
 *  设置行高
 */
-(NSMutableAttributedString*(^)(CGFloat height,NSRange range))if_setLineHeight;

/**
 *  @author icefire_wang, 16-09-05 16:09:55
 *
 *  设置文字颜色
 */
-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setTextColor;

/**
 *  @author icefire_wang, 16-09-05 16:09:28
 *
 *  设置字体
 */
-(NSMutableAttributedString*(^)(UIFont *font,NSRange range))if_setTextFont;

/**
 *  @author icefire_wang, 16-09-05 16:09:35
 *
 *  设置背景色
 */
-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setBackgroundColor;

/**
 *  @author icefire_wang, 16-09-05 16:09:43
 *
 *  设置 文字对齐基准线
 */
-(NSMutableAttributedString*(^)(CGFloat offset,NSRange range))if_setBaselineOffset;


/**
 *  @author icefire_wang, 16-09-05 16:09:04
 *
 *  插入图片
 */
-(void (^)(UIImage *image,CGRect bounds,NSUInteger index))if_insertImage;


/**
 *  @author icefire_wang 16-05-13 17:05:11
 *
 *   获取高度
 *
 * 
 */
-(CGFloat (^)(CGFloat width))if_getHeightInWidth;

@end
