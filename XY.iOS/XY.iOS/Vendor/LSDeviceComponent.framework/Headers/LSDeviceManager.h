//
//  LSDeviceManager.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/20.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lsmodels_inc.h"


/**
 设备组件类
 
 设备组件的所有接口都在主线程回调
 
 */
@interface LSDeviceManager : NSObject

/**
 设备组件对象
 
 @return 设备组件对象
 */
+ (instancetype)shared;

/**
 @brief 初始化(使用默认配置)
 
 在调用该方法前,请先调用`addDelegate:`添加一个代理对象，避免有些回调缺失.
 
 @see addDelegate:
 
 */
- (void)initManager;

/**
 @brief 初始化
 
 在调用该方法前,请先调用`addDelegate:`添加一个代理对象，避免有些回调缺失.

 @param config 配置项，如果为nil，将会使用默认配置
 
 @see addDelegate:

 */
- (void)initManagerWithConfig:(LSDeviceComponentConfig *)config;


/**
 扫描设备
 
 @warning `scanDevice:`和`stopScan`成对使用,请不要多次调用其中一个
 
 @see stopScan
 
 @param delegate 扫描回调
 
 */
- (void)scanDevice:(id<LSScanDeviceDelegate>)delegate;

/**
 停止扫描
 
 @see scanDevice:
 
 */
- (void)stopScan;

/**
 获取设置接口

 @return 设置接口实例
 
 */
- (id<LSDeviceSettingManager>)getSettingManager;

/**
 获取睡眠接口

 @return 睡眠接口实例
 
 */
- (id<LSSleepManager>)getSleepManager;

/**
 @brief 添加设备

 如调用者没有设备deviceId，请先调用`bindDevice:delegate:`接口获取

 @param device      设备
 @param userInfo    用户信息
 @param block       添加结果回调
 
 @warning           请不要调用`addDevice:userInfo:block:`后马上调用`removeDevice:block:`,如有这样的需求，请在添加回调后再做这样的操作
 
 @see bindDevice:delegate:
 @see removeDevice:block:
 
 */
- (void)addDevice:(LSDevice *)device userInfo:(LSDeviceUserInfo *)userInfo block:(LSAddDeviceCallBack)block;

/**
 删除设备

 @param deviceId    设备Id
 @param block       删除结果回调
 
 @warning           请不要调用`removeDevice:block:`后马上调用`addDevice:userInfo:block:`,如有这样的需求，请在添加回调后再做这样的操作

 @see addDevice:userInfo:block:
 
 */
- (void)removeDevice:(LSDeviceId)deviceId block:(LSRemoveDeviceCallBack)block;

/**
 添加设备回调代理对象
 
 @param delegate 回调代理对象
 
 @warning 添加后不使用请调用`removeDelegate:`移除
 
 @see removeDelegate:
 
 */
- (void)addDelegate:(id<LSDeviceManagerDelegate>)delegate;

/**
 删除设备回调代理对象
 
 @param delegate 回调代理对象

 @see addDelegate:

 */
- (void)removeDelegate:(id<LSDeviceManagerDelegate>)delegate;

/**
 获取设备连接状态

 @param deviceId 设备ID
 @param callback 结果回调
 */
- (void)checkDeviceConnectState:(LSDeviceId)deviceId callback:(void(^)(LSDeviceConnectState state))callback;

/**
 读取设备电量

 @param deviceId 设备ID
 @param delegate 电量回调
 
 @warning   本接口调用一次，回调一次。请控制好调用的频率，如调用太频繁，可能会引发设备处理不过来
 
 @warning   电量有两个回调，一个是`readBatteryInfo:delegate:`设置的电量回调，
            另一个是`LSDeviceManagerDelegate`里的`deviceManagerReceiveBatteryInfo:batteryInfo:`回调。
            `readBatteryInfo:delegate`是主动读取电量,不是所有手环设备都支持。
            `deviceManagerReceiveBatteryInfo:batteryInfo:`是设备自动上报电量，所有手环设备都支持。
            建议支持自动读取的设备使用`readBatteryInfo:delegate:`读取，这样电量更新的比较快。
 
 */
- (void)readBatteryInfo:(LSDeviceId)deviceId delegate:(id<LSBatteryInfoDelegate>)delegate;

/**
 @brief 绑定设备
 
 如调用者没有设备deviceId，请先调用该接口获取，然后再调用`addDevice:userInfo:block:`来添加设备

 @param macAddr 设备Mac地址
 @param delegate 绑定回调
 
 @see addDevice:userInfo:block:
 
 */
- (void)bindDevice:(NSString *)macAddr delegate:(id<LSBindDeviceDelegate>)delegate;

/**
 停止绑定设备流程

 @param macAddr 设备Mac地址
 */
- (void)stopBindDevice:(NSString *)macAddr;

/**
 @brief 升级设备固件
 
 如想终止升级，请调用`stopUpgrade:`
 
 @param deviceId 设备Id
 @param filePath 文件路径
 @param delegate 升级回调
 
 @see stopUpgrade:
 
 */
- (void)startUpgrade:(LSDeviceId)deviceId filePath:(NSString *)filePath delegate:(id<LSUpgradeDeviceDelegate>)delegate;

/**
 停止升级
 
 @param deviceId 设备Id
 
 @see startUpgrade:filePath:delegate:

 */
- (void)stopUpgrade:(LSDeviceId)deviceId;

/**
 设置同步接口

 @param delegate 同步接口
 */
- (void)setSyncInterface:(id<LSSyncDelegate>)delegate;

/**
 获取设备支持的功能
 
 @param model 设备型号
 @param softwareVer 设备软件版本
 @param hardwareVer 设备固件版本
 @return 支持设置的功能列表
 */
+ (NSArray <LSBaseFunction *> *)getDeviceSupportFunctions:(NSString *)model softwareVer:(NSString *)softwareVer hardwareVer:(NSString *)hardwareVer;

/**
 * 获取Log目录路径
 *
 * @return log目录路径
 *
 * @warning 请不要操作这个目录，SDK会自行维护该目录。
 */
- (NSString *)getLogPath;

/**
 sdk版本信息

 @return sdk版本信息
 */
+ (NSString *)version;


@end




