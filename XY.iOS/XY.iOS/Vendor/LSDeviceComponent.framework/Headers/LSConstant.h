//
//  LSConstant.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/3/20.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#ifndef LSConstant_h
#define LSConstant_h
#import <Foundation/Foundation.h>

@class LSSleepingData;
@class LSDevice;


/**
 配对流程中回调数据的Key,Code长度
 */
extern NSString * const LSBindDeviceHandlerDataKeyCodeLength;

/**
 配对流程中回调数据的Key,设备信息
 */
extern NSString * const LSBindDeviceHandleDataKeyDeviceInfo;

/**
 设备ID
 */
typedef NSString * LSDeviceId;

/**
 睡眠原始数据同步接口回调

 @param deviceId   设备ID
 @param sleepDatas 睡眠原始数据列表
 */
typedef void (^LSSleepSyncHandler)(LSDeviceId deviceId, NSArray<LSSleepingData *> *sleepDatas);

#define WEAK __weak

/**
 * 添加设备回调代码
 */
typedef NS_ENUM(NSUInteger, LSAddDeviceCallBackCode)
{
    /**
     * 添加成功
     */
    LSAddDeviceCallBackCodeSuccess,
    
    /**
     * 添加失败，设备已存在
     */
    LSAddDeviceCallBackCodeFailedAndExist,
    
    /**
     * 添加失败，设备参数有错
     */
    LSAddDeviceCallBackCodeFailedAndDeviceParamError,
};

/**
 添加设备回调

 @param device 设备
 @param code   操作结果
 */
typedef void(^LSAddDeviceCallBack)(LSDevice *device, LSAddDeviceCallBackCode code);


/**
 * 删除设备回调代码
 */
typedef NS_ENUM(NSUInteger, LSRemoveDeviceCallBackCode)
{
    /**
     * 删除成功
     */
    LSRemoveDeviceCallBackCodeSuccess,
    
    /**
     * 删除失败，设备不存在
     */
    LSRemoveDeviceCallBackCodeFailedAndNotExist,
    
    /**
     * 删除失败，设备参数有错
     */
    LSRemoveDeviceCallBackCodeFailedAndDeviceParamError,
};

/**
 删除设备回调
 */
typedef void(^LSRemoveDeviceCallBack)(LSDevice *device, LSRemoveDeviceCallBackCode code);


/**
 设置回调错误代码
 
 */
typedef NS_ENUM(NSUInteger, LSSettingCallBackCode)
{
    /**
     * 设置成功
     **/
    LSSettingCallBackCodeSuccess = 0,
    
    /**
     * 设置失败，SDK没有初始化
     **/
    LSSettingCallBackCodeSDKNotInit,
    
    /**
     * 设置失败，SDK没有启动
     **/
    LSSettingCallBackCodeSDKNotStart,

    /**
     * 设置失败，找不到设备或者设备未连接，请等待设备连接上后再设置
     **/
    LSSettingCallBackCodeDeviceNotFound,

    /**
     * 设置失败，设备不支持该功能
     **/
    LSSettingCallBackCodeFunctionIsNotSupport,
    
    /**
     * 设置失败，设备已断开
     **/
    LSSettingCallBackCodeDeviceDisConnected,
    
    /**
     * 设置失败，无效参数
     **/
    LSSettingCallBackCodeInvalidParameter,
};

/**
 睡眠分析结果代码
 */
typedef NS_ENUM(NSUInteger, LSSleepAnalysisResultCode)
{
    /**
     * 分析成功
     */
    LSSleepAnalysisResultCodeSuccess,

    /**
     * 分析失败,原因未知
     */
    LSSleepAnalysisResultCodeFail,
    
    /**
     * 分析失败，存在多时区的情况
     */
    LSSleepAnalysisResultCodeFailAndMultiTimeZone,

    /**
     * 分析失败，数据混合了多个设备
     */
    LSSleepAnalysisResultCodeFailAndMixData,
    
    /**
     * 分析失败，数据不完整
     */
    LSSleepAnalysisResultCodeFailAndIncompleteData,
};

/**
 升级设备回调状态
 
 */
typedef NS_ENUM(NSUInteger, LSUpgradeDeviceState)
{
    /**
     * 未知
     **/
    LSUpgradeDeviceStateUnknown,
    
    /**
     * 进入升级模式
     **/
    LSUpgradeDeviceStateEnterUpgradeMode,
    
    /**
     * 升级成功
     **/
    LSUpgradeDeviceStateSuccess,
    
    /**
     * 升级失败,蓝牙未开启
     **/
    LSUpgradeDeviceStateFailedAndBLENotAvailable,
    
    /**
     * 升级失败,连接超时
     **/
    LSUpgradeDeviceStateFailedAndConnectTimeout,
    
    /**
     * 升级失败,设备已经断开连接
     **/
    LSUpgradeDeviceStateFailedAndDeviceDisconnect,
    
    /**
     * 升级失败,SDK未初始化完成或未启动
     **/
    LSUpgradeDeviceStateFailedAndSDKNotAvailable,
    
    /**
     * 升级失败,设备已经添加到升级流程中
     **/
    LSUpgradeDeviceStateFailedAndDeviceIsExist,
    
    /**
     * 升级失败，升级文件不存在
     **/
    LSUpgradeDeviceStateFailedAndFileNotExist,
    
    /**
     * 升级失败，不支持该升级文件
     **/
    LSUpgradeDeviceStateFileNotSupported,

    /**
     * 升级失败，电量不足
     **/
    LSUpgradeDeviceStateFailedAndBatteryLow,
    
    /**
     * 升级失败，校验出错
     **/
    LSUpgradeDeviceStateFailedAndFileCheckFail,
    
    /**
     * 升级失败，设备拒绝下载
     **/
    LSUpgradeDeviceStateFailedAndDeviceReject,
    
};

/**
 蓝牙设备类型
 **/
typedef NS_ENUM(NSUInteger, LSDeviceType)
{
    /**
     * 未知
     **/
    LSDeviceTypeUnKnown = 0,

    /**
     * 体重秤
     **/
    LSDeviceTypeWeightScale,

    /**
     * 脂肪秤
     **/
    LSDeviceTypeFatScale,

    /**
     * 身高仪
     **/
//    LSDeviceTypeHeightMiriam,

    /**
     * 手环
     **/
    LSDeviceTypeWristBand = 4,

    /**
     * 腰围尺
     **/
//    LSDeviceTypeWaistlineRuler,
    
    /**
     * 血糖仪
     **/
//    LSDeviceTypeBloodGlucoseMeter ,

    /**
     * 体温计
     **/
//    LSDeviceTypeThermometer,

    /**
     * 血压计
     **/
    LSDeviceTypeSphygmomanometer = 8,
};

/**
 蓝牙状态
 */
typedef NS_ENUM(NSUInteger, LSBluetoothState)
{
    /**
     * 未知状态
     **/
    LSBluetoothStateUnknown = 0,
    
    /**
     * 手机不支持BLE
     **/
    LSBluetoothStateUnsupported,
    
    /**
     * 应用未获取蓝牙授权
     **/
    LSBluetoothStateUnauthorized,
    
    /**
     * 蓝牙关闭
     **/
    LSBluetoothStatePoweredOff,
    
    /**
     * 蓝牙打开
     **/
    LSBluetoothStatePoweredOn,
};


/**
 设备连接状态

 */
typedef NS_ENUM(NSUInteger, LSDeviceConnectState)
{
    /**
     * 已连接
     **/
    LSDeviceConnectStateConnected,

    /**
     * 已断开
     **/
    LSDeviceConnectStateDisconnected,
};

/**
 性别
 **/
typedef NS_ENUM(NSUInteger, LSSexType)
{
    /**
     * 男
     **/
    LSSexTypeMale,

    /**
     * 女
     **/
    LSSexTypeFemale,
    
    /**
     * 未知
     **/
    LSSexTypeUnknow,
};

/**
 手环目标设置
 **/
typedef NS_ENUM(NSUInteger, LSTargetType)
{
    /**
     * 步数
     */
    LSTargetTypeStep = 1,
    /**
     * 卡路里(Kcal)
     */
    LSTargetTypeCalorie,
    /**
     * 距离(m)
     */
    LSTargetTypeDistance,
    /**
     * 运动量
     */
    LSTargetTypeExerciseAmount
};


/**
 * 震动的类型
 **/
typedef NS_ENUM(NSUInteger, LSVibrationMode)
{
    /**
     * 持续震动
     **/
    LSVibrationModeContinuously = 0,
    
    /**
     * 间歇震动，震动强度不变
     **/
    LSVibrationModeIntermittent,
    
    /**
     * 间歇震动，震动强度由小变大
     **/
    LSVibrationModeWeak2Strong,
    
    /**
     * 间歇震动，震动强度由大变小
     **/
    LSVibrationModeStrong2Weak,
    
    /**
     * 震动强度大小循环
     **/
    LSVibrationModeCycle,
};

/**
 跑步类型
 */
typedef NS_ENUM(NSUInteger, LSSportMode)
{
    /**
     * 跑步数据
     **/
    LSSportModeRunning = 1,
    
    /**
     * 健走数据
     **/
    LSSportModeBriskWalking,
    
    /**
     * 游泳模式
     */
    LSSportModeSwimming = 4,
};

/**
 运动标志
 */
typedef NS_ENUM(NSUInteger, LSSportFlag)
{
    /**
     * 手动进入模式
     **/
    LSSportFlagNotAuto,
    
    /**
     * 自动进入模式
     **/
    LSSportFlagAuto,
    
    /**
     * 进入运动有GPS
     **/
    LSSportFlagGps,
    
    /**
     * 进入运动没有GPS
     **/
    LSSportFlagNoGps,
};

/**
 绑定操作状态
 */
typedef NS_ENUM(NSUInteger, LSBindDeviceHandlerCode)
{
    /**
     * 输入Code,部分设备可通过LSPairHanlderDataKeyCodeLength从回调的data中获取到\n
     * 设备显示上的Code的长度
     */
    LSBindDeviceHandlerCodeInput,
    
    /**
     * 确认配对,部分设备可通过LSPairHanlderDataKeyDeviceInfo从回调的data中获取到设备信息
     */
    LSBindDeviceHandlerCodeConfirm,
    
    /**
     * 未注册通知,部分设备可通过LSPairHanlderDataKeyDeviceInfo从回调的data中获取到设备信息
     */
    LSBindDeviceHandlerCodeUnregister,
    
    /**
     * 输入用户编号,部分设备可通过LSPairHanlderDataKeyDeviceInfo从回调的data中获取到设备信息
     */
    LSBindDeviceHandlerCodeInputUserNo,
};

/**
 绑定操作状态
 */
typedef NS_ENUM(NSUInteger, LSBindDeviceFailedCode)
{
    /**
     *  失败,找不到设备
     */
    LSBindDeviceFailedCodeNotFound,

    /**
     *  失败,设备返回失败
     */
    LSBindDeviceFailedCodeHandlerFail,
    
    /**
     *  失败,已在绑定流程中
     */
    LSBindDeviceFailedCodeIsExist,
    
    /**
     *  失败,蓝牙未开启
     */
    LSBindDeviceFailedCodeBLENotAvailable,
    
    /**
     *  失败,SDK未初始化完成或未启动
     */
    LSBindDeviceFailedCodeSDKNotAvailable,
    
    /**
     *  失败,断开连接
     */
    LSBindDeviceFailedCodeDisconnect,
    
    /**
     *  失败,不支持绑定操作
     */
    LSBindDeviceFailedCodeNotSupport,
    
    /**
     *  失败,无效数据
     */
    LSBindDeviceFailedCodeInvalidData,
};

/**
 提醒类型
 
 */
typedef NS_ENUM(NSUInteger, LSReminderType)
{
    
    /**
     * 来电
     */
    LSReminderTypeCall = 1,
    
    /**
     * 消息(全部的消息提醒)
     */
    LSReminderTypeMsg,
    
    /**
     *  短信
     */
    LSReminderTypeSMS = 4,
    
    /**
     *  微信
     */
    LSReminderTypeWechat = 5,
    
    /**
     * QQ提醒
     */
    LSReminderTypeQQ,
    
    /**
     * Facebook提醒
     */
    LSReminderTypeFacebook,
    
    /**
     * Twitter提醒
     */
    LSReminderTypeTwitter,
    
    /**
     * Line提醒
     */
    LSReminderTypeLine,
    
    /**
     * Gmail提醒
     */
    LSReminderTypeGmail,
    
    /**
     * KakaoTalk提醒
     */
    LSReminderTypeKakaoTalk,
    
    /**
     * WhatsApp提醒
     */
    LSReminderTypeWhatsApp,
    
    /**
     * SEWellness提醒
     */
    LSReminderTypeSEWellness = 254,
    
    
};

/**
  表盘类型

 */
typedef NS_ENUM(NSUInteger, LSDialStyle)
{
    /**
     *  表盘1
     */
    LSDialStyleOne = 1,
    /**
     *  表盘2
     */
    LSDialStyleTwo,
    /**
     *  表盘3
     */
    LSDialStyleThree,
    /**
     *  表盘4
     */
    LSDialStyleFour,
    /**
     *  表盘5
     */
    LSDialStyleFive,
    /**
     *  表盘6
     */
    LSDialStyleSix
};

/**
 心率开关类型

 */
typedef NS_ENUM(NSUInteger, LSHeartRateMeasureType)
{
    /**
     * 关
     */
    LSHeartRateMeasureTypeOff = 0,

    /**
     * 开
     */
    LSHeartRateMeasureTypeOn,

    /**
     * 开启智能心率
     */
    LSHeartRateMeasureTypeIntelligent,
};

/**
 佩戴方式

 */
typedef NS_ENUM(NSUInteger, LSWristStyle)
{
    /**
     * 左手
     */
    LSWristStyleLeft,
    
    /**
     * 右手
     */
    LSWristStyleRight,
};

/**
 屏幕显示方式
 
 */
typedef NS_ENUM(NSUInteger, LSScreenDirection)
{
    /**
     * 横屏
     */
    LSScreenDirectionLandscape,
    
    /**
     * 竖屏
     */
    LSScreenDirectionPortrait,
};

/**
 鼓励类型

 */
typedef NS_ENUM(NSUInteger, LSEncourageType)
{
    /**
     * 步数
     */
    LSEncourageTypeStep = 1,

    /**
     * 卡路里
     */
    LSEncourageTypeCalorie,

    /**
     * 距离
     */
    LSEncourageTypeDistance,
};

/**
 距离单位
 */
typedef NS_ENUM(NSUInteger, LSDistanceUnit)
{
    /**
     * 公里
     */
    LSDistanceUnitKM,
    
    /**
     * 英里
     */
    LSDistanceUnitMile,
};

/**
 屏幕内容

 */
typedef NS_ENUM(NSUInteger, LSScreenContentType)
{
    /**
     * 时间
     */
    LSScreenContentTypeTime = 0,

    /**
     * 步数
     */
    LSScreenContentTypeStep,
    
    /**
     * 卡路里
     */
    LSScreenContentTypeCalorie,
    
    /**
     * 距离
     */
    LSScreenContentTypeDistance,
    
    /**
     * 心率
     */
    LSScreenContentTypeHeartRate,
    
    /**
     * 跑步
     */
    LSScreenContentTypeRunning,
    
    /**
     * 健走
     */
    LSScreenContentTypeBriskWalking,

    /**
     * 游泳
     */
    LSScreenContentTypeSwimming = 8,
    
    /**
     * 日常数据
     */
    LSScreenContentTypeDailyData = 11,
    
    /**
     * 秒表
     */
    LSScreenContentTypeStopWatch,
    
    /**
     * 天气
     */
    LSScreenContentTypeWeather,
    
    /**
     * 电量
     */
    LSScreenContentTypeBattery,
};

/**
 体重目标类型
 */
typedef NS_ENUM(NSInteger,LSWeightTargetType)
{
    /**
     * 体重
     */
    LSWeightTargetTypeWeight = 1,
    
    /**
     * 其他
     */
    LSWeightTargetTypeOther
};

/**
 体重秤单位
 */
typedef NS_ENUM(NSUInteger, LSWeightUnit)
{
    
    /**
     * 公斤
     */
    LSWeightUnitKg = 0,
    
    /**
     * 磅
     */
    LSWeightUnitLb,
    
    /**
     * 英石
     */
    LSWeightUnitSt,
    
    /**
     * 斤
     */
    LSWeightUnitJin
};

/**
 身高单位
 */
typedef NS_ENUM(NSUInteger, LSHeightUnit)
{
    /**
     * 米
     */
    LSHeightUnitM,
    
    /**
     * 英寸
     */
    LSHeightUnitIn,
};

/**
 血压单位
 */
typedef NS_ENUM(NSUInteger, LSBloodPressureUnit)
{
    /**
     * mmHg
     */
    LSBloodPressureUnitMmHg,
    
    /**
     * kPa
     */
    LSBloodPressureUnitKPa,
};

/**
 血压计测量时袖口状态
 */
typedef NS_ENUM(NSUInteger, LSCuffFitStatus)
{
    /**
     * 袖口合适
     */
    LSCuffFitStatusSuitable,
    
    /**
     * 袖口太松
     */
    LSCuffFitStatusLoose,
};

/**
 脉冲范围
 */
typedef NS_ENUM(NSUInteger, LSPulseRateRangeStatus)
{
    /**
     * 脉率在该范围内
     */
    LSPulseRateRangeStatusWithinRange,
    
    /**
     * 脉搏超过上限
     */
    LSPulseRateRangeStatusMorethan,
    
    /**
     * 脉搏率小于下限
     */
    LSPulseRateRangeStatusBelow,
};

/**
 血压计测量时位置状态
 */
typedef NS_ENUM(NSUInteger, LSMeasurementPositionStatus)
{
    /**
     * 正确的测量位置
     */
    LSMeasurementPositionStatusCorrect,
    
    /**
     * 不正确的测量位置
     */
    LSMeasurementPositionStatusIncorrect,
};

/**
 时间标记类型
 */
typedef NS_OPTIONS(NSUInteger, LSTimeFlag)
{
    /**
     * 支持UTC
     */
    LSTimeFlagUTCSupport       = 1,
    
    /**
     * 支持TimeZone
     */
    LSTimeFlagTimeZoneSupport  = 1 << 1,
    
    /**
     * 支持Date
     */
    LSTimeFlagDateSupport      = 1 << 2,
};

/**
 自动识别多运类型
 */
typedef NS_ENUM(NSUInteger, LSAutomaticSportsType)
{
    /**
     * 跑步
     */
    LSAutomaticSportsTypeRunning = 1,
    /**
     * 健走
     */
    LSAutomaticSportsTypeBriskWalking,
    /**
     * 骑行
     */
    LSAutomaticSportsTypeCycling,
    /**
     * 游泳
     */
    LSAutomaticSportsTypeSwimming,
};

/**
 人的类别
 */
typedef NS_ENUM(NSInteger, LSPeopleType)
{
    /**
     * 普通
     */
    LSPeopleTypeNormal,
    
    /**
     * 运动员
     */
    LSPeopleTypeSporter
};

#endif /* LSConstant_h */
