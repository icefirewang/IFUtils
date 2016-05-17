//
//  UILabel+IFAdjust.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "UILabel+IFAdjust.h"

@implementation UILabel (IFAdjust)


-(void)adjustWidth
{
    [self adjustWidthOffset:0];
}

-(void)adjustWidthOffset:(CGFloat)offset
{
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:self.font, NSFontAttributeName, nil];
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGRect newRect = self.frame;
    newRect.size.width = rect.size.width + offset;
    [self setFrame:newRect];
}

@end
