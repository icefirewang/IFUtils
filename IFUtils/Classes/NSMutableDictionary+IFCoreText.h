//
//  NSMutableDictionary+IFCoreText.h
//  IFUtils
//
//  Created by wangjian on 16/5/13.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableDictionary (IFCoreText)






-(NSMutableDictionary*(^)(CGFloat height))if_coretextLineHeight;
-(NSMutableDictionary*(^)(UIColor *color))if_coretextColor;
-(NSMutableDictionary*(^)(UIFont *font))if_coretextFont;
-(NSMutableDictionary*(^)(UIColor *color))if_coretextBgColor;




@end
