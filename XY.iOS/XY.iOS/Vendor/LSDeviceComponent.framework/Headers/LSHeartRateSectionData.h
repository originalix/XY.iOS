//
//  LSHeartRateSectionData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"

/**
 心率区间统计数据
 */
@interface LSHeartRateSectionData : LSBaseDataModel

/**
 每天统计截止的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 心率区间I累计时间(秒)
 */
@property (nonatomic, assign) NSUInteger duration1;

/**
 心率区间II累计时间(秒)
 */
@property (nonatomic, assign) NSUInteger duration2;

/**
 心率区间III累计时间(秒)
 */
@property (nonatomic, assign) NSUInteger duration3;

@end
