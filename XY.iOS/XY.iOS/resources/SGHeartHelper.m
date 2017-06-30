//
//  SGHeartHelper.m
//  XY.iOS
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "SGHeartHelper.h"

@implementation SGHeartHelper

+ (NSString *)formatMeasureTime:(NSString *)time {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateformatter dateFromString:time];
    dateformatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [dateformatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)formatCurrentTime {
    return [SGHeartHelper convertCurrentDate:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)convertTimeBeforeFormat:(NSString *)beforeFormat convertFormat:(NSString *)converFormat timeStr:(NSString *)time {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = beforeFormat;
    NSDate *date = [dateformatter dateFromString:time];
    dateformatter.dateFormat = converFormat;
    NSString *dateStr = [dateformatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)convertCurrentDate:(NSString *)format {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = format;
    NSString *dateStr = [dateformatter stringFromDate:[NSDate date]];
    return dateStr;
}



@end
//2017-06-30 10:44:59
