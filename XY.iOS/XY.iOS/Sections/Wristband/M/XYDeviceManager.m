//
//  XYDeviceManager.m
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYDeviceManager.h"

@interface XYDeviceManager()<LSDeviceManagerDelegate>

@end

@implementation XYDeviceManager

IMSingletonM()

- (void)initializeSDK {
    [[LSDeviceManager shared] addDelegate: self];
    [[LSDeviceManager shared] initManager];
}

- (void)deviceManagerInitFinish:(BOOL)bSuccess {
    
}

- (void)deviceManagerBleState:(LSBluetoothState)state {

}

- (void)deviceManagerDeviceConnectionChanged:(LSDeviceId)deviceId state:(LSDeviceConnectState)state {

}

- (void)deviceManagerReceiveDeviceInfo:(LSDeviceId)deviceId deviceInfo:(LSDeviceInfo *)deviceInfo {

}

/**
 设备上传电量信息
 
 @param deviceId 设备标识
 @param batteryInfo 电量信息
 */
- (void)deviceManagerReceiveBatteryInfo:(LSDeviceId)deviceId batteryInfo:(LSBatteryInfo *)batteryInfo
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([batteryInfo class]), batteryInfo]];
    
}

/**
 设备上传步数数据回调
 
 @param deviceId 设备
 @param data 步数数据
 */
- (void)deviceManagerReceiveWalkingData:(LSDeviceId)deviceId data:(LSWalkingData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传睡眠数据回调
 
 @param deviceId 设备
 @param data 睡眠数据
 */
- (void)deviceManagerReceiveSleepingData:(LSDeviceId)deviceId data:(LSSleepingData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传心率数据回调
 
 @param deviceId 设备
 @param data 心率数据
 */
- (void)deviceManagerReceiveHeartRateData:(LSDeviceId)deviceId data:(LSHeartRateData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传运动心率数据回调
 
 @param deviceId 设备
 @param data 运动心率数据
 */
- (void)deviceManagerReceiveSportHeartRateData:(LSDeviceId)deviceId data:(LSSportHeartRateData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传跑步卡路里数据回调
 
 @param deviceId 设备
 @param data 卡路里数据
 */
- (void)deviceManagerReceiveSportCalorieData:(LSDeviceId)deviceId data:(LSSportCalorieData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传心率区间统计数据回调
 
 @param deviceId 设备
 @param data 心率区间数据
 */
- (void)deviceManagerReceiveHeartRateSectionData:(LSDeviceId)deviceId data:(LSHeartRateSectionData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传运动数据回调
 
 @param deviceId 设备
 @param data 运动数据
 */
- (void)deviceManagerReceiveSportData:(LSDeviceId)deviceId data:(LSSportData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传运动模式状态数据回调
 
 @param deviceId 设备
 @param data 运动模式状态数据
 */
- (void)deviceManagerReceiveSportModeStateData:(LSDeviceId)deviceId data:(LSSportModeStateData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 设备上传运动配速数据回调
 
 @param deviceId 设备
 @param data 运动配速数据
 */
- (void)deviceManagerReceiveSportSpeedData:(LSDeviceId)deviceId data:(LSSportSpeedData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 称上传体重数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveWeightData:(LSDeviceId)deviceId data:(LSWeightData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 称上传单位设置回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveWeightUnitData:(LSDeviceId)deviceId data:(LSWeightUnitData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 称上传体脂数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveBodyCompositionData:(LSDeviceId)deviceId data:(LSBodyCompositionData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}

/**
 血压计上传体测量数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveBloodPressureData:(LSDeviceId)deviceId data:(LSBloodPressureData *)data
{
    [self hookLogCallback:deviceId content:[NSString stringWithFormat:@"[%@]:%@", NSStringFromClass([data class]), data]];
}


#pragma mark - Private Method

- (void)hookLogCallback:(NSString *)tag content:(NSString *)content {

}

@end
