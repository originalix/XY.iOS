//
//  LSAlarmClockFunction.h
//  LSDeviceComponent
//
//  Created by apple on 2017/6/6.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseFunction.h"

/**
 闹钟功能
 */
@interface LSAlarmClockFunction : LSBaseFunction

/**
 * 是否支持标签
 **/
@property (nonatomic, assign) BOOL isSupportLabel;

/**
 * 闹钟索引最小值
 **/
@property (nonatomic, assign) NSUInteger  minIndex;

/**
 * 闹钟索引最大值
 **/
@property (nonatomic, assign) NSUInteger  maxIndex;

@end
