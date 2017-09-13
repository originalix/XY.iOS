//
//  LSHeartRateRangeCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 区间
 */
@interface LSHeartRateRange : NSObject

/**
 最小心率
 */
@property (nonatomic, assign) NSUInteger min;

/**
 最大心率
 */
@property (nonatomic, assign) NSUInteger max;

@end

/**
 心率区间配置
 */
@interface LSHeartRateRangeCfg : NSObject

/**
 年龄(范围:1-70，年龄小于1默认值是40，大于70默认40),默认:25
 */
@property (nonatomic, assign) NSUInteger age;

/**
 区间列表，一定要有三个区间
 */
@property (nonatomic, strong) NSArray<LSHeartRateRange *> *ranges;

@end
