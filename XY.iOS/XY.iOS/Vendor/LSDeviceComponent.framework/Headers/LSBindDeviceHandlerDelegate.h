//
//  LSBindDeviceProcessDelegate.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/26.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 绑定操作
 */
@protocol LSBindDeviceHandlerDelegate <NSObject>

/**
 输入绑定代码
 @param macAddr 设备mac地址
 @param code 绑定代码
 */
- (void)inputCode:(NSString *)macAddr code:(NSString *)code;

/**
 确认绑定
 @param macAddr 设备mac地址
 @param isConfirm 是否确认绑定
 */
- (void)confirm:(NSString *)macAddr isConfirm:(BOOL)isConfirm;

/**
 注册设备
 @param macAddr 设备mac地址
 @param deviceId 设备ID
 */
- (void)registerDevice:(NSString *)macAddr deviceId:(LSDeviceId)deviceId;

/**
 输入用户编号绑定
 @param macAddr 设备mac地址
 @param userNo 用户编号
 */
- (void)inputUserNo:(NSString *)macAddr userNo:(NSInteger)userNo;


@end
