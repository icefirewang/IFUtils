//
//  NSMutableDictionary+IFCoreText.h
//  IFUtils
//
//  Created by icefire_wang on 16/5/13.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (IFCoreText)






-(NSMutableDictionary*(^)(CGFloat height))if_coretextLineHeight;
-(NSMutableDictionary*(^)(UIColor *color))if_coretextColor;
-(NSMutableDictionary*(^)(UIFont *font))if_coretextFont;
-(NSMutableDictionary*(^)(UIColor *color))if_coretextBgColor;
-(NSMutableDictionary*(^)(CGFloat offset))if_baselineOffset;


//-(NSMutableDictionary*)if_coretextTextColor:(UIColor*)color;
//-(NSMutableDictionary*)if_coretextFont:(UIFont*)font;
//-(NSMutableDictionary*)if_coretextBackgroundColor:(UIColor*)color;




@end
