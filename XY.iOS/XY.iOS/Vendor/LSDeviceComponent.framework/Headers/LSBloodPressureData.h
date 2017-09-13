//
//  LSBloodPressureData.h
//  LSDeviceComponent
//
//  Created by hanfeng.li on 2017/7/18.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 血压数据
 */
@interface LSBloodPressureData : LSBaseDataModel

/**
 用户ID
 */
@property (nonatomic, assign) NSUInteger userNo;

/**
 时间戳
 */
@property (nonatomic, assign) NSUInteger time;

/**
 血压单位
 */
@property (nonatomic, assign) LSBloodPressureUnit unit;

/**
 舒张压
 */
@property (nonatomic, assign) float diastolic;

/**
 平均动脉压
 */
@property (nonatomic, assign) float MAP;

/**
 收缩压
 */
@property (nonatomic, assign) float systolic;

/**
 脉搏
 */
@property (nonatomic, assign) float pulseRate;

/**
 测量时身体是否移动
 */
@property (nonatomic, assign) BOOL isBodyMovement;

/**
 袖口状态
 */
@property (nonatomic, assign) LSCuffFitStatus cuffFitStatus;

/**
 是否有不规则脉冲
 */
@property (nonatomic, assign) BOOL isIrregularPuls;

/**
 脉冲范围
 */
@property (nonatomic, assign) LSPulseRateRangeStatus pulseRateRangeStatus;

/**
 测量位置状态
 */
@property (nonatomic, assign) LSMeasurementPositionStatus measurementPositionStatus;


@end
