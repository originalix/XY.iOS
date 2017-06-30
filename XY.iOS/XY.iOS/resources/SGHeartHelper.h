//
//  SGHeartHelper.h
//  XY.iOS
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGHeartHelper : NSObject


/**
 将测量时间转化成 yyyy-MM-dd格式输出

 @param time MeasureTime
 @return String
 */
+ (NSString *)formatMeasureTime:(NSString *)time;

+ (NSString *)formatCurrentTime;

//BASE
+ (NSString *)convertCurrentDate:(NSString *)format;
+ (NSString *)convertTimeBeforeFormat:(NSString *)beforeFormat convertFormat:(NSString *)converFormat timeStr:(NSString *)time;

@end
