//
//  LSSportHeartRateData.h
//  LSleDevice
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 运动心率数据类型
 */
@interface LSSportHeartRateData : LSBaseDataModel

/**
 运动数据的类型
 */
@property (nonatomic, assign) LSSportMode sportMode;

/**
 运动标志
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

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
