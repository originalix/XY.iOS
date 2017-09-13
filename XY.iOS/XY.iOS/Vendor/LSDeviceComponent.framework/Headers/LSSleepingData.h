//
//  LSSleepingData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"

/**
 睡眠数据
 */
@interface LSSleepingData : LSBaseDataModel

/**
 睡眠数据开始的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 每个睡眠数据相隔的时间(秒)
 */
@property (nonatomic, assign) NSUInteger timeOffset;

/**
 本地时间与UTC相隔的时间(秒)
 */
@property (nonatomic, assign) NSInteger gmtOffset;

/**
 睡眠状态数据列表(类型:整数)
 */
@property (nonatomic, strong) NSArray<NSNumber *> *statusList;

/**
 睡眠状态数据列表的16进制字符串表示
 */
@property (nonatomic, readonly) NSString *hexString;

/**
 产生睡眠数据的设备型号
 */
@property (nonatomic, strong) NSString *model;

/**
 产生睡眠数据的固件版本
 */
@property (nonatomic, strong) NSString *softwareVersion;

/**
 产生睡眠数据的硬件版本
 */
@property (nonatomic, strong) NSString *hardwareVersion;

@end
