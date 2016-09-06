//
//  UIImage+IFFixOrientation.h
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IFFixOrientation)


/**
 *  @author icefire_wang, 16-05-16 14:05:23
 *
 *  根据image原本的Orientation 摆正图片
 *
 *  @return 修正后的图片
 */
-(UIImage*)if_fixOrientation;


/**
 *  @author icefire_wang, 16-05-16 14:05:36
 *
 *  摆正有旋转的图片
 *
 *  @param ori 图片的朝向
 *
 *  @return 修正后的新图片
 */
-(UIImage*)if_fixImageByOrientation:(UIImageOrientation)ori;

@end
