//
//  LSSyncDelegate.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/29.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lsmodels_inc.h"

/**
 同步接口代理
 */
@protocol LSSyncDelegate <NSObject>

/**
 查询睡眠原始数据

 @param deviceId 设备Id
 @param startTime 开始的时间
 @param endTime 结束的时间
 @param handler 操作的对象
 
 @warning 无论有没有数据，开发者最后一定要调用handler告诉SDK
 
 */
- (void)querySleepData:(LSDeviceId)deviceId startTime:(NSUInteger)startTime endTime:(NSUInteger)endTime handler:(void (^)(LSDeviceId deviceId, NSArray<LSSleepingData *> *sleepDatas))handler;

@end
