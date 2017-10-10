//
//  NSString+LSSettingFailureCode.m
//  LSDemo
//
//  Created by lifesense on 17/6/2.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "NSString+LSSettingFailureCode.h"

@implementation NSString (LSSettingFailureCode)

+ (NSString *)settingFailureCodeToStr:(LSSettingCallBackCode)code
{
    NSString *message = @"未知原因";
    switch (code)
    {
        case LSSettingCallBackCodeSDKNotInit:
            message = @"SDK没有初始化";
            break;
        case LSSettingCallBackCodeSDKNotStart:
            message = @"SDK没有启动";
        case LSSettingCallBackCodeDeviceNotFound:
            message = @"找不到设备或者设备未连接";
            break;
        case LSSettingCallBackCodeFunctionIsNotSupport:
            message = @"设备不支持该功能";
            break;
        case LSSettingCallBackCodeDeviceDisConnected:
            message = @"设备已断开";
            break;
        default:
            break;
    }
    return message;
}

@end
