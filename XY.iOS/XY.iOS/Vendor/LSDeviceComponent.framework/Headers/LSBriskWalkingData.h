//
//  LSBriskWalkingData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"
#import "LSSportState.h"

/**
 健走数据
 */
@interface LSBriskWalkingData : LSBaseDataModel

/**
 运动标识
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

/**
 健走持续时间(单位:秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 健走总消耗卡路里(单位:0.1Kcal)
 */
@property (nonatomic, assign) float calories;

/**
 健走总步数
 */
@property (nonatomic, assign) NSUInteger step;

/**
 健走最大心率
 */
@property (nonatomic, assign) NSUInteger maxHR;

/**
 健走平均心率
 */
@property (nonatomic, assign) NSUInteger avgHR;

/**
 健走距离(单位:米)
 */
@property (nonatomic, assign) NSUInteger distance;

/**
 健走最大速度(0.01Km/h)
 */
@property (nonatomic, assign) float maxSpeed;

/**
 健走平均速度(0.01Km/h)
 */
@property (nonatomic, assign) float avgSpeed;

/**
 健走状态数据
 */
@property (nonatomic, strong) NSArray<LSSportState *> *sportStates;

/**
 0:无最大步频和平均步频,
 1:有最大步频和平均步频
 */
@property (nonatomic, assign) NSUInteger flag;

/**
 健走最大步频
 */
@property (nonatomic, assign) NSUInteger maxStepFreq;

/**
 健走平均步频
 */
@property (nonatomic, assign) NSUInteger avgStepFreq;

@end
