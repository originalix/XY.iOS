//
//  LSSedentaryCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSVibrationStyleCfg.h"

/**
 久坐提醒设置
 */
@interface LSSedentaryCfg : NSObject

/**
 索引,默认:0,(范围:0~2)
 */
@property (nonatomic, assign) NSUInteger index;

/**
 是否开启,默认:NO
 */
@property (nonatomic, assign) BOOL enable;

/**
 开启的日期,默认:0000000
 用7个字符组成的字符串存储，如："1111100"，周一到周五开启闹铃
 */
@property (nonatomic, strong) NSString *weeks;

/**
 开始的时间(时,范围:0~23),默认:8时
 */
@property (nonatomic, assign) NSUInteger startHour;

/**
 开始的时间(分,范围:0~59),默认:0分
 */
@property (nonatomic, assign) NSUInteger startMin;

/**
 结束的时间(时,范围:0~23),默认:18时
 */
@property (nonatomic, assign) NSUInteger endHour;

/**
 结束的时间(分,范围:0~59),默认:0分
 */
@property (nonatomic, assign) NSUInteger endMin;

/**
 多久不动就提醒(分,范围:1~255),默认:60
 */
@property (nonatomic, assign) NSUInteger interval;

/**
 震动的类型
 */
@property (nonatomic, strong) LSVibrationStyleCfg *vibrationStyle;

@end
