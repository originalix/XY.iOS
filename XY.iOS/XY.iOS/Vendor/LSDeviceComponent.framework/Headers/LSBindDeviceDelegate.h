//
//  LSBindDeviceDelegate.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/26.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"
#import "LSBindDeviceHandlerDelegate.h"

/**
 绑定设备回调
 */
@protocol LSBindDeviceDelegate <NSObject>

/**
 绑定失败
 @param macAddr 设备mac地址
 @param code 失败代码
 */
- (void)onBindDeviceFailed:(NSString *)macAddr code:(LSBindDeviceFailedCode)code;

/**
 绑定成功
 @param macAddr 设备mac地址
 @param device 设备
 */
- (void)onBindDeviceSuccess:(NSString *)macAddr device:(LSDevice *)device;

/**
 绑定流程操作
 @param macAddr 设备mac地址
 @param code 流程操作代码
 @param handler 操作的接口(根据操作代码调用)
 @param data 配对回调的数据,根据code从data里面取值,详细请看`LSBindDeviceHandlerCode`
 
 @see LSBindDeviceHandlerCode
 
 */
- (void)onBindDeviceProcess:(NSString *)macAddr code:(LSBindDeviceHandlerCode)code handler:(WEAK id<LSBindDeviceHandlerDelegate>)handler data:(NSDictionary *)data;

@end
