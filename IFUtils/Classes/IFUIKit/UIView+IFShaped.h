//
//  UIView+IFShaped.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IFShaped)

-(void)if_setMaskImage:(UIImage*)maskImage;

-(void)if_setContentImage:(UIImage*)image;

-(void)if_setContentsCenter:(CGRect)contentsCenter;

@end
