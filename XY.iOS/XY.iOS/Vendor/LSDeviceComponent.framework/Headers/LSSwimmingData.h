//
//  LSSwimmingData.h
//  LSleDevice
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 游泳数据
 */

@interface LSSwimmingData : LSBaseDataModel

/**
 运动数据的类型
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

/**
 *  开始时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger startTime;

/**
 *  结束时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger endTime;

/**
 *  游泳时长(秒)
 */
@property (nonatomic, assign) NSUInteger duration;

/**
 *  圈数
 */
@property (nonatomic, assign) NSUInteger laps;

/**
 *  游泳总消耗卡路里 (单位:0.1 Kcal)
 */
@property (nonatomic, assign) float calories;


@end
