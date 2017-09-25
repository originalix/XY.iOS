//
//  LSHeartRateSwitchCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 心率开关设置
 */
@interface LSHeartRateSwitchCfg : NSObject

/**
 是否启用, 默认:NO
 */
@property (nonatomic, assign) BOOL enable;

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

@end
