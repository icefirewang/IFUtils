//
//  UIImage+IFFixOrientation.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IFFixOrientation)


/**
 *  @author 王健, 16-05-16 14:05:23
 *
 *  根据image原本的Orientation 摆正图片
 *
 *  @return 修正后的图片
 */
-(UIImage*)if_fixOrientation;


/**
 *  @author 王健, 16-05-16 14:05:36
 *
 *  摆正有旋转的图片
 *
 *  @param ori 图片的朝向
 *
 *  @return 修正后的新图片
 */
-(UIImage*)if_fixImageByOrientation:(UIImageOrientation)ori;

@end
