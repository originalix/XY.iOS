//
//  LSSportCalorieData.h
//  LSleDevice
//
//  Created by lifesense－mac on 17/5/3.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"


/**
 运动卡路里数据
 */
@interface LSSportCalorieData : LSBaseDataModel

/**
 运动的类型
 */
@property (nonatomic, assign) LSSportMode sportMode;

/**
 运动标志
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

/**
 卡路里数据开始的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 每个卡路里数据相隔的时间(秒)
 */
@property (nonatomic, assign) NSUInteger timeOffset;

/**
 卡路里数据列表(单位:大卡，类型:浮点)
 */
@property (nonatomic, strong) NSArray<NSNumber *> *calories;

@end
