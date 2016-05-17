//
//  UIView+IFShaped.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "UIView+IFShaped.h"
#import <objc/runtime.h>
#import "MethodSwizzle.h"


static char key_contentLayer;
static char key_shapedLayer;

@interface UIView ()

@property (nonatomic,strong) CALayer *contentLayer;
@property (nonatomic,strong) CAShapeLayer *maskLayer;
@property (nonatomic,strong) UIImage *maskImage;
@property (nonatomic) CGRect contentsCenter;

@property (nonatomic,strong) UIImage *contentImage;

@end

@implementation UIView (IFShaped)


+(void)load
{
    MethodSwizzle(self,@selector(setFrame:),@selector(if_sefFrame:));
}

-(void)if_sefFrame:(CGRect)frame
{
    [self if_sefFrame:frame];
    if ([self contentLayer:NO] && CGRectEqualToRect([self contentLayer:NO].frame, self.bounds) == NO) {
        self.contentLayer.frame = self.bounds;
        [self.contentLayer removeAllAnimations]; // 去除动画 效果
    }
    
    if ([self maskLayer:NO] && CGRectEqualToRect([self maskLayer:NO].frame, self.bounds) == NO) {
        self.maskLayer.frame = self.bounds;
        [self.maskLayer removeAllAnimations];  // 去除动画 效果
    }
}


#pragma mark - interface
-(void)if_setMaskImage:(UIImage *)maskImage
{
    self.maskLayer.contents = (id)maskImage.CGImage;
    [self setup];
}

-(void)if_setContentImage:(UIImage *)image
{
    self.contentLayer.contents = (id)image.CGImage;
    [self setup];
}

-(void)if_setContentsCenter:(CGRect)contentsCenter
{
    self.maskLayer.contentsCenter = contentsCenter;
    [self setup];
}

#pragma mark - getter / setter
-(CALayer*)contentLayer
{
    return [self contentLayer:YES];
}

-(CAShapeLayer*)maskLayer
{
    return [self maskLayer:YES];
}

-(CALayer*)contentLayer:(BOOL)create
{
    CALayer *layer = objc_getAssociatedObject(self,&key_contentLayer);
    if (!layer && create) {
        layer = [[CALayer alloc] init];
        layer.mask = self.maskLayer;
        layer.frame = self.bounds;
        objc_setAssociatedObject(self, &key_contentLayer, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return layer;
}

-(CAShapeLayer*)maskLayer:(BOOL)create
{
    CAShapeLayer *maskLayer = objc_getAssociatedObject(self,&key_shapedLayer);
    if (!maskLayer && create) {
        maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.fillColor = [UIColor blackColor].CGColor;
        maskLayer.contentsScale = [UIScreen mainScreen].scale;
        maskLayer.frame = self.bounds;
        objc_setAssociatedObject(self, &key_shapedLayer, maskLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return maskLayer;
}

-(void)setup
{
    if (self.contentLayer.superlayer == nil) {
        [self.layer addSublayer:self.contentLayer];
    }else{
        
    }
}



@end
