//
//  LSHeartRateData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"

/**
 心率数据
 */
@interface LSHeartRateData : LSBaseDataModel

/**
 心率数据开始的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 每个状态相隔的时间(秒)
 */
@property (nonatomic, assign) NSUInteger timeOffset;

/**
 心率状态数据列表
 */
@property (nonatomic, strong) NSArray<NSNumber *> *heartRates;

/**
 心率状态数据列表的16进制字符串表示
 */
@property (nonatomic, readonly) NSString *hexString;


@end
