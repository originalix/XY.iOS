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

/**
 格式化输出当天的时间 yyyy-MM-dd HH:mm:ss

 @return String
 */
+ (NSString *)formatCurrentTime;

@end
