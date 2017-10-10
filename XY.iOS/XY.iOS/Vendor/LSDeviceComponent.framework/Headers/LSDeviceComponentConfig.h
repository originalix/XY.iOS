//
//  LSDeviceComponentConfig.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/9/11.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 SDK配置类,用于配置SDK的一些功能
 */
@interface LSDeviceComponentConfig : NSObject

/**
 蓝牙未打开时,打开app是否弹出的蓝牙未打开对话框(默认:YES)
 */
@property (nonatomic, assign) BOOL isShowPowerAlert;

@end
