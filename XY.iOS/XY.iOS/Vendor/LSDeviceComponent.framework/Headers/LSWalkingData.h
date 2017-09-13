//
//  LSWalkingData.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/28.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"

/**
 步数数据
 */
@interface LSWalkingData : LSBaseDataModel

/**
 步数
 */
@property (nonatomic, assign) NSUInteger step;

/**
 记录产生步数时的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 卡路里
 */
@property (nonatomic, assign) float calories;

/**
 距离(m)
 */
@property (nonatomic, assign) NSUInteger distance;

@end
