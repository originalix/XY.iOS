//
//  LSRunningData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"
#import "LSSportState.h"

/**
 跑步数据
 */
@interface LSRunningData : LSBaseDataModel

/**
 运动标识
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

/**
 跑步持续时间(单位:秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 跑步总消耗卡路里(单位:0.1Kcal)
 */
@property (nonatomic, assign) float calories;

/**
 跑步总步数
 */
@property (nonatomic, assign) NSUInteger step;

/**
 跑步最大心率
 */
@property (nonatomic, assign) NSUInteger maxHR;

/**
 跑步平均心率
 */
@property (nonatomic, assign) NSUInteger avgHR;

/**
 运动状态数据
 */
@property (nonatomic, strong) NSArray<LSSportState *> *sportStates;

/**
 跑步距离(单位:米)
 */
@property (nonatomic, assign) NSUInteger distance;

/**
 跑步最大速度(0.01Km/h)
 */
@property (nonatomic, assign) float maxSpeed;

/**
 跑步平均速度(0.01Km/h)
 */
@property (nonatomic, assign) float avgSpeed;

/**
 0:无最大步频和平均步频(有跑步距离，跑步最大速度，跑步平均速度),
 1:有最大步频和平均步频(有跑步距离，跑步最大速度，跑步平均速度),
 2:有最大步频和平均步频(没有跑步距离，跑步最大速度，跑步平均速度),
 */
@property (nonatomic, assign) NSUInteger flag;

/**
 跑步最大步频
 */
@property (nonatomic, assign) NSUInteger maxStepFreq;

/**
 跑步平均步频
 */
@property (nonatomic, assign) NSUInteger avgStepFreq;

@end
