//
//  NCFrame.m
//  NodeChat
//
//  Created by wangjian on 14-11-17.
//  Copyright (c) 2014年 jiayu. All rights reserved.
//




#import "IFFrame.h"


@implementation IFFrame



CGFloat f320Stretch(CGFloat width)
{
    CGFloat screen_width = SCREEN_WIDTH;
    CGFloat ret = width/(320.f / screen_width);
    return toPoint5(ret);
}

CGFloat fScreenWidth()
{
    return [UIScreen mainScreen].bounds.size.width;
}

+(CGFloat)screen_width
{
    return [UIScreen mainScreen].bounds.size.width;
}
+(CGFloat)screen_height
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    return height;
}


+(CGFloat)naviBarHeight
{
   
    return 44 + FStatus;
}



+(CGRect)frame_full
{
    return [[UIScreen mainScreen] bounds];
}



+(CGRect)bound_full
{
    return [[UIScreen mainScreen] bounds];
}
+(CGRect)bound_status
{
    CGFloat off = FStatus;
    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-off);
}
+(CGRect)bound_status_navi
{
    CGFloat off = FStatus+FNavi;
    CGRect ret = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-off);
    return ret;
    
}
+(CGRect)bound_status_tab
{
    CGFloat off = FStatus+FTab;
    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-off);
}

+(CGRect)bound_tab
{
    CGFloat off = FTab;
    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-off);
}

+(CGRect)bound_status_navi_tab
{
    CGFloat off = FStatus+FNavi+FTab;
    return CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-off);

}


+(CGFloat)statusBarHeight
{
    CGFloat ret = [UIApplication sharedApplication].statusBarFrame.size.height;
    NSLog(@"status bar height %f",ret);
    return ret;
}


+(CGFloat)get320Persent:(CGFloat)width
{
    CGFloat screen_width = SCREEN_WIDTH;
    CGFloat ret = width/(320.f / screen_width);
    ret = toPoint5(ret);
    return ret;
}

+(CGFloat)get375Persent:(CGFloat)width
{
    CGFloat screen_width = SCREEN_WIDTH;
    CGFloat ret = width/(375.f / screen_width);
    ret = toPoint5(ret);
    return ret;

}

+(CGFloat)get568persent:(CGFloat)height
{
    CGFloat screen_height = SCREEN_HEIGHT;
    CGFloat ret = height/(568.f / screen_height);
    ret = toPoint5(ret);
    return ret;
}


+(CGFloat)get667Persent:(CGFloat)height
{
    CGFloat screen_height = SCREEN_HEIGHT;
    CGFloat ret = height/(667.f / screen_height);
    ret = toPoint5(ret);
    return ret;
}

+(CGRect)get320StretchOfRect:(CGRect)rect
{
    CGFloat x = k320Stretch(rect.origin.x);
    CGFloat y = k568Stretch(rect.origin.y);
    CGFloat width = k320Stretch(rect.size.width);
    CGFloat height = k320Stretch(rect.size.height);
    return CGRectMake(x, y, width, height);

}

+(CGRect)getStringFrame:(NSString*)string font:(UIFont*)font width:(CGFloat)width
{
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect;
}

@end
