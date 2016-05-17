//
//  IFDate.h
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,IFNoon){
    kIFNoonUnknow,
    kIFNoonMorning,
    kIFNoonAfternoon
};


@interface IFDate : NSObject


@property (nonatomic) long long ts;         // 初始化时间搓
@property (nonatomic) long long disDayToNow; // 今天相隔几天      ( now - day)
@property (nonatomic,strong) NSDate *date; // 对应的date;
//@property (nonatomic,copy) NSString *strDateDescribe;  // 日期的描述
//@property (nonatomic,copy) NSString *strTimeDescribe;  // 时间的描述

@property (nonatomic) int32_t year;               // 年
@property (nonatomic) int32_t month;              // 月
@property (nonatomic) int32_t day;                // 日
@property (nonatomic) int32_t hour_24;            // 24 小时制时间
@property (nonatomic) int32_t hour_12;            // 12 小时制时间
@property (nonatomic) int32_t min;                // 分
@property (nonatomic) int32_t sec;                // 秒
@property (nonatomic) IFNoon noon;               // 上下午
@property (nonatomic) int32_t weekDay;            // 星期   星期日 == 1； 星期六 == 7

@property (nonatomic) NSInteger nowYear;
@property (nonatomic) NSDate *now;  /// 当前日期



/**
 *  @author 王健, 16-02-23 11:02:34
 *
 *  必要初始化函数
 *
 *  @param ts 毫秒时间戳
 *
 *  @return 对象
 */
-(instancetype)initWithTs:(long long)ts;



-(instancetype)initWithDate:(NSDate*)date;


/**
 *  @author 王健, 16-03-08 14:03:14
 *
 *  中国 星期几表示 ： 星期一，星期二。。。。
 *
 *  @return String
 */
-(NSString*)zhWeekDay;


/**
 *  @author 王健, 16-03-24 15:03:01
 *
 *  中国年： 二零一
 *
 *  @return
 */
-(NSString*)zhYear;

/**
 *  @author 王健, 16-03-24 15:03:29
 *
 *  中文 月  十一 十二
 *
 *  @return
 */
-(NSString*)zhMonth;

/**
 *  @author 王健, 16-03-24 15:03:50
 *
 *  中文天   一  二  二十四
 *
 *  @return
 */
-(NSString*)zhDay;


-(void)selfTest;


@end
