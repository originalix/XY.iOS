//
//  NSString+LSSettingFailureCode.h
//  LSDemo
//
//  Created by lifesense on 17/6/2.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LSDeviceComponent/LSDeviceComponent.h>
@interface NSString (LSSettingFailureCode)
+ (NSString *)settingFailureCodeToStr:(LSSettingCallBackCode)code;
@end
