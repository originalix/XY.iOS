//
//  LSAlarmClockCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/28.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSVibrationStyleCfg.h"

/**
 闹钟信息
 */
@interface LSAlarmClockCfg : NSObject

/**
 闹钟索引,默认:1
 */
@property (nonatomic, assign) NSUInteger index;

/**
 闹钟标签,默认:one
 */
@property (nonatomic, strong) NSString *label;

/**
 闹钟是否开启,默认:NO
 */
@property (nonatomic, assign) BOOL enable;

/**
 闹钟开启的日期,默认:0000000
 用7个字符组成的字符串存储，如："1111100"，周一到周五开启闹铃
 */
@property (nonatomic, strong) NSString *weeks;

/**
 开始的时间(时),默认:8时
 */
@property (nonatomic, assign) NSUInteger startHour;

/**
 开始的时间(分),默认:0分
 */
@property (nonatomic, assign) NSUInteger startMin;

/**
 震动的类型
 */
@property (nonatomic, strong) LSVibrationStyleCfg *vibrationStyle;

@end
