//
//  LSSportSpeedData.h
//  LSleDevice
//
//  Created by lifesense－mac on 17/5/4.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import "LSBaseDataModel.h"
#import "LSConstant.h"

/**
 运动配速数据
 */
@interface LSSportSpeedData : LSBaseDataModel

/**
 运动类型
 */
@property (nonatomic, assign) LSSportMode sportMode;

/**
 运动标识
 */
@property (nonatomic, assign) LSSportFlag sportFlag;

/**
 配速数据开始的时间戳(秒)
 */
@property (nonatomic, assign) NSUInteger time;

/**
 每个配速数据相隔的时间(秒)
 */
@property (nonatomic, assign) NSUInteger timeOffset;

/**
 配速数据列表(整数)
 */
@property (nonatomic, strong) NSArray<NSNumber *> *speeds;


@end
