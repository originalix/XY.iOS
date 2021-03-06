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

/**
 转换时间成时间戳

 @param time 时间
 @param format 时间格式
 @return Integer
 */
+ (NSInteger)convertToTimestamp:(NSString *)time format:(NSString *)format;

/**
 时间戳格式化时间输出

 @param timestamp 时间戳
 @return String
 */
+ (NSString *)convertToDateStrWithTimestamp:(NSInteger)timestamp;

/**
 十六进制字符串转化成NSData对象

 @param str 十六进制字符串
 @return Data
 */
+ (NSData *)convertHexStrToData:(NSString *)str;

/**
 NSData对象转化为十六进制字符串

 @param data NSData obj
 @return String
 */
+ (NSString *)convertDataToHexStr:(NSData *)data;

@end
