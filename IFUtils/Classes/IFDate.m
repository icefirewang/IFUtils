//
//  IFDate.m
//  JJUtils
//
//  Created by wangjian on 16/5/16.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "IFDate.h"

NSString* zhNumber(NSInteger number)
{
    assert(0<= number && number <= 10);
    NSArray *array = @[@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十"];
    return array[number];
}


@implementation IFDate

#pragma mark - inherit



-(instancetype)initWithTs:(long long)ts
{
    self = [super init];
    if (self) {
        self.ts = ts;
        if (ts == 0) {
            NSLog(@" nil ts !!");
        }
        [self commonInit];
    }
    return self;
}


-(instancetype)initWithDate:(NSDate*)date
{
    self = [super init];
    if (self) {
        self.ts = [date timeIntervalSince1970]*1000;
        self.date = date;
        [self commonInit];
    }
    return self;
}


-(void)commonInit
{
    _disDayToNow = LONG_LONG_MAX;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
    NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents *dc = [calendar components:unit fromDate:self.date];
    self.year = (int32_t)[dc year];
    self.month = (int32_t)[dc month];
    self.day = (int32_t)[dc day];
    self.sec = (int32_t)[dc second];
    self.hour_24 = (int32_t)[dc hour];
    self.min = (int32_t)[dc minute];
    self.weekDay = (int32_t)[dc weekday];
    
    if (self.hour_24 == 12) {       // 刚好 =12 点
        self.noon = kIFNoonAfternoon;
        self.hour_12 = self.hour_24;
    }else if (self.hour_24 <12) {   // 上午 12点
        self.noon = kIFNoonMorning;
        self.hour_12 = self.hour_24;
    }else{                           // 下午其它时间
        self.noon = kIFNoonAfternoon;
        self.hour_12 = self.hour_24 - 12;
    }
    
    
    //        for (int i = 1; i < 32; i++) {
    //            self.day = i;
    //            NSLog(@"day  %@",[self zhDay]);
    //        }
    //
    //        for (int i = 1; i< 13; i++) {
    //            self.month = i;
    //            NSLog(@"month %@",[self zhMonth]);
    //        }
    //
    //        for (int i = 1000; i<9999; i++) {
    //            self.year = i;
    //            NSLog(@"year : %@",[self zhYear]);
    //        }

}

#pragma mark - interface

/**
 *  @author 王健, 16-03-08 14:03:14
 *
 *  中国 星期几表示 ： 星期一，星期二。。。。
 *
 *  @return String
 */
-(NSString*)zhWeekDay
{
    if (self.weekDay <= 0  || self.weekDay > 7) {
        NSAssert(FALSE, @"!!");
        return nil;
    }
    NSArray *weekDay = @[@"天",@"一",@"二",@"三",@"四",@"五",@"六"];
    return [NSString stringWithFormat:@"星期%@",weekDay[self.weekDay-1]];
}


/**
 *  @author 王健, 16-03-24 15:03:01
 *
 *  中国年： 二零一
 *
 *  @return
 */
-(NSString*)zhYear
{
    NSInteger year = self.year;
    if (1000 > year || year >= 10000) {
        NSAssert(FALSE, @"");
        return nil;
    }
    NSString *qian = zhNumber(year/1000);
    NSString *bai = zhNumber(year%1000/100);
    NSString *shi = zhNumber(year%100/10);
    NSString *ge = zhNumber(year%10);
    
    return [NSString stringWithFormat:@"%@%@%@%@",qian,bai,shi,ge];
}

/**
 *  @author 王健, 16-03-24 15:03:29
 *
 *  中文 月  十一 十二
 *
 *  @return
 */
-(NSString*)zhMonth
{
    NSInteger month = self.month;
    if (month > 12 || month <=0 ) {
        NSAssert(FALSE, @"");
        return nil;
    }
    NSInteger shi = month/10;
    NSInteger ge = month%10;
    NSMutableString *temp = [[NSMutableString alloc] init];
    if (shi > 0) {
        [temp appendString:@"十"];
    }
    if(ge>0){
        NSString *strMonth = zhNumber(ge);
        [temp appendString:strMonth];
    }
    
    return [NSString stringWithString:temp];
}



/**
 *  @author 王健, 16-03-24 15:03:50
 *
 *  中文天   一  二  二十四
 *
 *  @return
 */
-(NSString*)zhDay
{
    NSInteger day = self.day;
    if (day <= 0 || day > 31 ) {
        NSAssert(FALSE, @"");
        return nil;
    }
    NSInteger shi = day/10;
    NSInteger ge = day%10;
    NSMutableString *temp = [[NSMutableString alloc] init];
    if (shi > 1) {
        NSString *strShi = zhNumber(shi);
        [temp appendFormat:@"%@十",strShi];
    }else if (shi == 1){
        [temp appendString:@"十"];
    }else{
        // do nothing
    }
    
    if(ge>0){
        NSString *strGe = zhNumber(ge);
        [temp appendString:strGe];
    }
    
    return [NSString stringWithString:temp];
}


/**
 *  @author 王健, 16-05-16 14:05:01
 *
 *  当前年
 *
 *  @return 年
 */
-(NSInteger)nowYear
{
    if (_nowYear == 0) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unit = NSCalendarUnitYear;
        NSDateComponents *dc = [calendar components:unit fromDate:[NSDate date]];
        _nowYear = [dc year];
    }
    return _nowYear;
}


-(NSDate*)date
{
    if (_date == nil) {
        _date = [NSDate dateWithTimeIntervalSince1970:self.ts/1000];
        NSLog(@"date %@",_date);
    }
    return _date;
}


-(void)selfTest
{
    NSLog(@"=================");
    NSLog(@"ts %lld",self.ts);
    NSLog(@"date %@",self.date);
    NSLog(@"year:>%d",self.year);
    NSLog(@"month:>%d",self.month);
    NSLog(@"day:>%d",self.day);
    NSLog(@"hour_12:>%d",self.hour_12);
    NSLog(@"hour_24:>%d",self.hour_24);
    NSLog(@"min:>%d",self.min);
    NSLog(@"sec:>%d",self.sec);
    NSLog(@"noon:>%@",@(self.noon));
    NSLog(@"weekDay:>%d",self.weekDay);
    NSLog(@"zhYear:>%@",self.zhYear);
    NSLog(@"zhMonth:>%@",self.zhMonth);
    NSLog(@"zhDay:>%@",self.zhDay);
    NSLog(@"zhWeekDay:%@",[self zhWeekDay]);
    NSLog(@"isThisYear:%@",@([self isThisYear]));
    
}

#pragma mark - parivate

-(NSDate*)now
{
    if (_now == nil) {
        _now = [NSDate date];
    }
    return _now;
}


-(BOOL)isToday
{
    return (self.disDayToNow == 0);
}

-(BOOL)isThisYear
{
    return (self.year == self.nowYear);
}


-(NSString*)getHMDescribe_12 // 12小时制 hh:mm表示
{
    return [NSString stringWithFormat:@"%02d:%02d",self.hour_12,self.min];
}

-(NSString*)getHMDescribe_24 // 24小时制 HH:mm 表示
{
    return [NSString stringWithFormat:@"%02d:%02d",self.hour_24,self.min];
}





@end
