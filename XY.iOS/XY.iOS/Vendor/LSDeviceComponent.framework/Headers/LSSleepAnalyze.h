//
//  LSSleepAnalyze.h
//  LSSleepAnalyze
//
//  Created by lifesense on 16/1/15.
//  Copyright © 2016年 Lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 注：如加入算法库后无法编译，提示缺少std::之类的，请添加libstdc++.tbd库
 */

/**
 *  睡眠状态
 */
typedef NS_ENUM(NSUInteger, LSSleepStatus) {
    /**
     *  醒着
     */
    LSSleepStatusAwake = 1,
    /**
     *  浅睡眠
     */
    LSSleepStatusLight,
    /**
     *  深睡眠
     */
    LSSleepStatusDeep,
};


/**
 * 睡眠算法版本
 */
typedef NS_ENUM(NSUInteger, LSSleepAnalyzeVersion) {
    LSSleepAnalyzeVersion_V1, // 适用于HR,来电以及Watch T810之前版本
    LSSleepAnalyzeVersion_V2, // 适用于Watch T810及更新固件版本,MT和Gold
    LSSleepAnalyzeVersion_V3, // 

};

@interface LSSleepStatusData : NSObject

/**
 * 睡眠状态
 */
@property (nonatomic, assign) LSSleepStatus status;

/**
 * 开始时间
 */
@property (nonatomic, assign) long long startTime;

/**
 * 结束时间
 */
@property (nonatomic, assign) long long endTime;

/*
 * 持续时间
 */
@property (nonatomic, assign) int duration;

@end


@interface LSSleepAnalyzeResult : NSObject

/**
 * 入睡时间UTC
 */
@property (nonatomic, assign) long long sleepTimeUTC;

/**
 * 起床时间UTC
 */
@property (nonatomic, assign) long long getupTimeUTC;

/**
 * 深睡时间长度(分)
 */
@property (nonatomic, assign) long long deepSleepTime;

/**
 * 浅睡时间长度(分)
 */
@property (nonatomic, assign) long long lightSleepTime;

/**
 * 清醒时间长度(分)
 */
@property (nonatomic, assign) long long awakeSleepTime;

/**
 * 醒来的次数
 */
@property (nonatomic, assign) long long awakeCount;

/**
 * 睡眠状态数据列表
 */
@property (nonatomic, strong) NSArray<LSSleepStatusData *> *sleepStatus;

@end

//@interface LSSleepResult : LSSleepAnalyzeResult
//
//@end

//
//@interface LSSleepDataAnalysisResult : NSObject
//
///**
// *  错误代码，无错误则为0，详见sdk文档
// */
//@property (nonatomic, assign) NSUInteger code;
//
///**
// *  睡眠分析结果列表
// */
//@property (nonatomic, strong) NSArray<LSSleepResult *> *results;
//
//@end


/**
 睡眠算法配置类，V3后可使用,V1,V2不生效
 */
@interface LSSleepAnalyzeConfig : NSObject

/**
 是否启用心率辅助(默认:开)
 */
@property (nonatomic, assign) BOOL enableHR;

/**
 是否启用多段睡眠(默认:关)
 */
@property (nonatomic, assign) BOOL enableMulti;

/**
 是否启用小憩检测，如:午睡之类的(默认:关)
 */
@property (nonatomic, assign) BOOL enableNap;

@end



@interface LSSleepAnalyze : NSObject

/**
 *  算法版本
 *
 *  @return 算法版本
 */
+ (NSString *)version;

+ (NSUInteger)buildVersion;

/**
 *  分析睡眠数据（请使用dataAnalysis接口）
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳(秒)
 *  @param utcOffset    每笔睡眠数据的时间间隔(秒)
 *  @param timeZone     时区，取值区间: -12~12
 *
 *  @return 分析结果
 */
+ (NSArray<LSSleepAnalyzeResult *> *)sleepAnalyze:(NSString *)srcSleepData time:(long long)time utcOffset:(int)utcOffset timeZone:(int)timeZone;

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
 */
+ (NSArray<LSSleepAnalyzeResult *> *)dataAnalysis:(NSString *)srcSleepData time:(long long)time interval:(int)interval gmtOffset:(int)gmtOffset version:(LSSleepAnalyzeVersion)version;

/**
 *  分析睡眠数据
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳(秒)
 *  @param interval     每笔睡眠数据的时间间隔(秒)
 *  @param gmtOffset    睡眠数据本地的时间与UTC之间的时间差(秒),本地时间=utc + gmtOffset
 *  @param config       算法配置(目前仅V3有)
 *  @param version      选用算法版本
 *
 *  @return 分析结果
 */
+ (NSArray<LSSleepAnalyzeResult *> *)dataAnalysis:(NSString *)srcSleepData time:(long long)time interval:(int)interval gmtOffset:(int)gmtOffset config:(LSSleepAnalyzeConfig *)config version:(LSSleepAnalyzeVersion)version;

/**
 *  根据实际的睡眠时间分析睡眠数据，得出睡眠状态（请使用analysisStatus接口）
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳
 *  @param utcOffset    每笔睡眠数据的时间间隔(秒)
 *  @param sleepTime    入睡时间戳(秒)
 *  @param getupTime    起床时间戳(秒)
 *
 *  @return 分析结果
 */
+ (NSArray <LSSleepAnalyzeResult *> *)sleepAnalyze:(NSString *)srcSleepData time:(long long)time utcOffset:(int)utcOffset sleepTime:(long long)sleepTime getupTime:(long long)getupTime;


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
 */
+ (LSSleepAnalyzeResult *)analysisStatus:(NSString *)srcSleepData time:(long long)time interval:(int)interval sleepTime:(long long)sleepTime getupTime:(long long)getupTime version:(LSSleepAnalyzeVersion)version;

/**
 *  根据实际的睡眠时间分析睡眠数据，得出睡眠状态
 *
 *  @param srcSleepData 原始睡眠数据字符串
 *  @param time         睡眠数据开始的时间戳(秒)
 *  @param interval     每笔睡眠数据的时间间隔(秒)
 *  @param sleepTime    入睡时间戳(秒)
 *  @param getupTime    起床时间戳(秒)
 *  @param config       算法配置(目前仅V3有)
 *  @param version      选用算法版本
 *
 *  @return 分析结果
 */
+ (LSSleepAnalyzeResult *)analysisStatus:(NSString *)srcSleepData time:(long long)time interval:(int)interval sleepTime:(long long)sleepTime getupTime:(long long)getupTime config:(LSSleepAnalyzeConfig *)config version:(LSSleepAnalyzeVersion)version;

@end
