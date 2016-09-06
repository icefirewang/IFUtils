//
//  NCFrame.h
//  NodeChat
//
//  Created by icefire_wang on 14-11-17.
//  Copyright (c) 2014年 jiayu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IFViewAdditions.h"


#define FNavi           (44.f)
#define FStatus         [IFFrame statusBarHeight]
#define FTab            (50.f)

#define SCREEN_WIDTH        [IFFrame screen_width]
#define SCREEN_HEIGHT       [IFFrame screen_height]

#define k320Stretch(x)     [IFFrame get320Persent:x]
#define k375Stretch(x)     [IFFrame get375Persent:x]
#define k568Stretch(x)     [IFFrame get568persent:x]
#define k667Stretch(x)     [IFFrame get667Persent:x]





@interface IFFrame : NSObject


CGFloat f320Stretch(CGFloat width);
CGFloat fScreenWidth();

+(CGFloat)screen_width;
+(CGFloat)screen_height;

+(CGFloat)naviBarHeight;

+(CGRect)bound_full;
+(CGRect)bound_status;
+(CGRect)bound_status_navi;
+(CGRect)bound_status_navi_tab;
+(CGRect)bound_status_tab;
+(CGRect)bound_tab;
+(CGFloat)statusBarHeight;
+(CGFloat)get320Persent:(CGFloat)width;
+(CGFloat)get375Persent:(CGFloat)width;
+(CGFloat)get568persent:(CGFloat)height;
+(CGFloat)get667Persent:(CGFloat)height;
+(CGRect)get320StretchOfRect:(CGRect)rect;

+(CGRect)getStringFrame:(NSString*)string font:(UIFont*)font width:(CGFloat)width;

@end
