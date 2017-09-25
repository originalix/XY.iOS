//
//  LSSleepManager.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/7/26.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSSleepAnalyze.h"

/**
 睡眠接口类
 */
@protocol LSSleepManager <NSObject>

/**
 获取睡眠分析结果
 
 @param deviceId 设备ID
 @param startTime 分析数据的开始时间
 @param endTime 分析数据的结束的时间
 @param callback 分析结果回调
 
 @warning 请调用`LSDeviceManager`的设置同步接口`setSyncInterface:`，否则有可能出现睡眠分析失败等情况
 */
- (void)analyseSleep:(LSDeviceId)deviceId startTime:(NSUInteger)startTime endTime:(NSUInteger)endTime callback:(void(^)(LSSleepAnalysisResultCode code, NSArray<LSSleepAnalyzeResult *> *results))callback;

/**
 *  根据实际的睡眠时间分析睡眠数据，得出睡眠状态
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳(秒)
 *  @param interval     每笔睡眠数据的时间间隔(秒)
 *  @param sleepTime    入睡时间戳(秒)
 *  @param getupTime    起床时间戳(秒)
 *  @param version      选用算法版本
 *
 *  @return 分析结果
 *
 *  @warning 兼容使用睡眠算法SDK的接口,如没有使用过睡眠算法SDK,请忽略该接口,后面可能将会移除该接口
 */
- (LSSleepAnalyzeResult *)analysisStatus:(NSString *)srcSleepData time:(NSUInteger)time interval:(NSUInteger)interval sleepTime:(NSUInteger)sleepTime getupTime:(NSUInteger)getupTime version:(LSSleepAnalyzeVersion)version;

/**
 *  分析睡眠数据
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳(秒)
 *  @param interval     每笔睡眠数据的时间间隔(秒)
 *  @param gmtOffset    睡眠数据本地的时间与UTC之间的时间差(秒),本地时间=utc + gmtOffset
 *  @param version      选用算法版本
 *
 *  @return 分析结果
 *
 *  @warning 兼容使用睡眠算法SDK的接口,如没有使用过睡眠算法SDK,请忽略该接口,后面可能将会移除该接口
 */
- (NSArray<LSSleepAnalyzeResult *> *)dataAnalysis:(NSString *)srcSleepData time:(NSUInteger)time interval:(NSUInteger)interval gmtOffset:(NSInteger)gmtOffset version:(LSSleepAnalyzeVersion)version;

@end
