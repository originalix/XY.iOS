//
//  FaceConfig.m
//  XY.iOS
//
//  Created by Lix on 2017/7/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "FaceConfig.h"
#import <iflyMSC/IFlyFaceSDK.h>

#define IFLY_APPID @"58413222"

@interface FaceConfig()

@end

@implementation FaceConfig

+ (void)config {
    NSLog(@"IFlyMSC version = %@", [IFlySetting getVersion]);
    [IFlySetting setLogFile:LVL_ALL];
    [IFlySetting showLogcat:YES];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    //设置msc.log的保存路径
    [IFlySetting setLogFilePath:cachePath];
    
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@,", IFLY_APPID];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
}

@end
