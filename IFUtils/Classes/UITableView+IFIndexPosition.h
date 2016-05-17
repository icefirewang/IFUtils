//
//  UITableView+IFIndexPosition.h
//  
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (IFIndexPosition)



/**
 *  @author 王健, 16-03-02 10:03:54
 *
 *  目标section 的底部
 *
 *  @param tarSection 目标section
 *
 *  @return 底部的 y
 */
-(CGFloat)bottomOfSection:(NSInteger)tarSection;



/**
 *  @author 王健, 16-03-02 10:03:29
 *
 *  顶部的Y
 *
 *  @param tarSection 目标section
 *
 *  @return y
 */
-(CGFloat)topOfSection:(NSInteger)tarSection;

/**
 *  获取某个index path 的顶部位置
 *
 *  @param indexPath
 *
 *  @return contentOffset y
 */
-(CGFloat)topOfIndexPath:(NSIndexPath*)indexPath;


/**
 *  获取某个index path 的底部位置
 *
 *  @param indexPath
 *
 *  @return contentOffset y
 */
-(CGFloat)bottomOfIndexPath:(NSIndexPath*)indexPath;

@end
