//
//  NSMutableAttributedString+IFCoreText.h
//  IFUtils
//
//  Created by wangjian on 16/5/13.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (IFCoreText)


-(NSMutableAttributedString*(^)(CGFloat height,NSRange range))if_setLineHeight;
-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setTextColor;
-(NSMutableAttributedString*(^)(UIFont *font,NSRange range))if_setTextFont;
-(NSMutableAttributedString*(^)(UIColor *color,NSRange range))if_setBackgroundColor;
-(void (^)(UIImage *image,CGRect bounds,NSUInteger index))if_insertImage;


/**
 *  @author 王健, 16-05-13 17:05:11
 *
 *  getStringHiehgt
 *  #warn you should set line height or font of all range, or this function won`t work correctily
 */
-(CGFloat (^)(CGFloat width))if_getHeightInWidth;

@end
