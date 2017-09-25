//
//  LSDeviceSettingManager.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/3/20.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lsmodels_inc.h"
#import "LSConstant.h"

@class LSDevice;

/**
 设置回调

 @param deviceId    设备Id
 @param code        设置回调结果
 */
typedef void(^LSSettingCallback)(LSDeviceId deviceId, LSSettingCallBackCode code);

/**
 设备设置类
 */
@protocol LSDeviceSettingManager <NSObject>

/**
 闹钟设置

 @param deviceId 设备
 @param clock 闹钟信息
 @param callback 回调
 */
- (void)setAlaramClock:(LSDeviceId)deviceId clock:(LSAlarmClockCfg *)clock callback:(LSSettingCallback)callback;

/**
 提醒设置(来电，消息等)

 @param deviceId 设备
 @param reminderCfg 提醒配置
 @param callback 回调
 */
- (void)setReminder:(LSDeviceId)deviceId reminderCfg:(LSReminderCfg *)reminderCfg callback:(LSSettingCallback)callback;

/**
 表盘风格设置

 @param deviceId 设备
 @param style 表盘风格
 @param callback 回调
 */
- (void)setDialStyle:(LSDeviceId)deviceId style:(LSDialStyle)style callback:(LSSettingCallback)callback;

/**
 天气设置

 @param deviceId 设备
 @param weather 天气信息列表
 @param callback 回调
 */
- (void)setWeathers:(LSDeviceId)deviceId weather:(LSWeatherCfg *)weather callback:(LSSettingCallback)callback;

/**
 久坐提醒设置

 @param deviceId 设备
 @param sedentary 久坐提醒信息
 @param callback 回调
 */
- (void)setSedentary:(LSDeviceId)deviceId sedentary:(LSSedentaryCfg *)sedentary callback:(LSSettingCallback)callback;

/**
 心率监测设置

 @param deviceId 设备
 @param type 心率监测类型
 @param callback 回调
 */
- (void)setHeartRateMeasureType:(LSDeviceId)deviceId type:(LSHeartRateMeasureType)type callback:(LSSettingCallback)callback;

/**
 心率区间设置

 @param deviceId 设备
 @param rangeCfg 心率区间(必须有3个)
 @param callback 回调
 */
- (void)setHeartRateRange:(LSDeviceId)deviceId rangeCfg:(LSHeartRateRangeCfg *)rangeCfg callback:(LSSettingCallback)callback;

/**
 运动心率区间告警设置

 @param deviceId 设备
 @param alertCfg 心率区间信息
 @param callback 回调
 */
- (void)setSportHeartRateAlert:(LSDeviceId)deviceId alertCfg:(LSSportHeartRateAlertCfg *)alertCfg callback:(LSSettingCallback)callback;

/**
 佩戴方式设置

 @param deviceId 设备
 @param style 佩戴方式
 @param callback 回调
 */
- (void)setWristStyle:(LSDeviceId)deviceId style:(LSWristStyle)style callback:(LSSettingCallback)callback;

/**
 屏幕方向设置

 @param deviceId 设备
 @param direction 屏幕方向
 @param callback 回调
 */
- (void)setScreenDirection:(LSDeviceId)deviceId direction:(LSScreenDirection)direction callback:(LSSettingCallback)callback;

/**
 夜间模式设置

 @param deviceId 设备
 @param modeCfg 夜间模式信息
 @param callback 回调
 */
- (void)setNightMode:(LSDeviceId)deviceId modeCfg:(LSNightModeCfg *)modeCfg callback:(LSSettingCallback)callback;

/**
 鼓励设置

 @param deviceId 设备
 @param encourageCfg 鼓励配置
 @param callback 回调
 */
- (void)setEncourage:(LSDeviceId)deviceId encourageCfg:(LSEncourageCfg *)encourageCfg callback:(LSSettingCallback)callback;


/**
 GPS状态设置
 
 @param deviceId 设备
 @param enable GPS是否开启
 @param callback 回调
 */
- (void)setGPSStatus:(LSDeviceId)deviceId enable:(BOOL)enable callback:(LSSettingCallback)callback;

/**
 是否使用24小时显示格式设置
 
 @param deviceId 设备
 @param isUse   是否使用24小时显示格式
 @param callback 回调
 */
- (void)use24HourClock:(LSDeviceId)deviceId isUse:(BOOL)isUse callback:(LSSettingCallback)callback;

/**
  距离单位设置
 
 @param deviceId 设备
 @param unit 距离单位
 @param callback 回调
 */
- (void)setDistanceUnit:(LSDeviceId)deviceId unit:(LSDistanceUnit)unit callback:(LSSettingCallback)callback;

/**
 屏幕显示内容设置

 @param deviceId 设备
 @param contents 屏幕显示的内容列表(LSScreenContentType列表)
 @param callback 回调
 */
- (void)setScreenContent:(LSDeviceId)deviceId contents:(NSArray<NSNumber *> *)contents callback:(LSSettingCallback)callback;

/**
 设置用户信息

 @param deviceId 设备
 @param userInfo 用户信息
 @param callback 回调
 */
- (void)updateUserInfo:(LSDeviceId)deviceId userInfo:(LSDeviceUserInfo *)userInfo callback:(LSSettingCallback)callback;

/**
 设置体重单位
 
 @param deviceId 设备
 @param unit 单位
 @param callback 回调
 */
- (void)setWeightUnit:(LSDeviceId)deviceId unit:(LSWeightUnit)unit callback:(LSSettingCallback)callback;

/**
 设置体重目标
 
 @param deviceId 设备
 @param target 目标
 @param callback 回调
 */
- (void)setWeightTarget:(LSDeviceId)deviceId target:(LSWeightTargetCfg *)target callback:(LSSettingCallback)callback;


/**
 设置自动识别多运动开关到手环
 @param deviceId 设备
 @param automaticSports 自动识别类型
 @param callback 回调
 */
- (void)setAutomaticSports:(LSDeviceId)deviceId automaticSports:(NSArray<LSAutomaticSportsCfg*> *)automaticSports callback:(LSSettingCallback)callback;


/**
 设置语言
 @param deviceId 设备
 @param code 语言代码
 @param callback 回调
 */
- (void)setLanguage:(LSDeviceId)deviceId languageCode:(NSString *)code callback:(LSSettingCallback)callback;

/**
 设置配速参数
 @param deviceId 设备
 @param speed 配速参数数据模型
 @param callback 回调
 */
- (void)setSpeed:(LSDeviceId)deviceId speed:(LSSpeedCfg *)speed callback:(LSSettingCallback)callback;

/**
 设置游泳参数
 @param deviceId 设备
 @param swim 游泳参数数据模型
 @param callback 回调
 */
- (void)setSwim:(LSDeviceId)deviceId swim:(LSSwimCfg *)swim callback:(LSSettingCallback)callback;
@end
