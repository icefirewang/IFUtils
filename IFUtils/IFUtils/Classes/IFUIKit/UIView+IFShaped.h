//
//  UIView+IFShaped.h
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IFShaped)

-(void)if_setMaskImage:(UIImage*)maskImage;

-(void)if_setContentImage:(UIImage*)image;

-(void)if_setContentsCenter:(CGRect)contentsCenter;

@end
