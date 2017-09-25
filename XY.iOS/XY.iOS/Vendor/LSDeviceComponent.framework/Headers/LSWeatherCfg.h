//
//  LSWeatherCfg.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/5/10.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark LSWeatherInfo
/**
 天气信息
 */
@interface LSWeatherInfo : NSObject

/**
 天气状态，默认:0,状态如下：
 0:晴(白天),1:晴(晚上),2:多云,3:晴间多云(白天),4:晴间多云(夜晚),5:大部多云(白天),6:大部多云(夜晚),7:阴天,8:阵雨,9:雷阵雨,10:冰雹或雷阵雨伴有冰雹,11:小雨,12:中雨,13:大雨,14:暴雨,15:大暴雨,16:特大暴雨,17:冻雨,18:雨夹雪,19:阵雪,20:小雪,21:中雪,22:大雪,23:暴雪,24:浮尘,25:扬尘,26:沙尘暴,27:强沙尘暴,28:雾,29:霾,30:风,31:大风,32:飓风,33:热带风暴,34:龙卷风
 */
@property (nonatomic, assign) NSUInteger weatherState;

/**
 最低温度(单位:摄氏度), 默认:28
 */
@property (nonatomic, assign) NSInteger lowestTemperature;

/**
 最高温度(单位:摄氏度), 默认:33
 */
@property (nonatomic, assign) NSInteger highestTemperature;

/**
 空气质量指数, 默认:80
 */
@property (nonatomic, assign) NSUInteger aqi;

@end


#pragma mark LSWeatherCfg
/**
 天气配置
 */
@interface LSWeatherCfg : NSObject

/**
 当前获取天气信息的时间
 */
@property (nonatomic, assign) NSUInteger updateTime;

/**
 天气信息列表，按列表顺序表示今天、明天、后天.....(最多5天)
 */
@property (nonatomic, strong) NSArray<LSWeatherInfo *> *weatherInfos;

@end
