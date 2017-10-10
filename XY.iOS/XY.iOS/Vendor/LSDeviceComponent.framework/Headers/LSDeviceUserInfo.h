//
//  LSUserInfo.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/4/18.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

/**
 设备用户的信息
 */
@interface LSDeviceUserInfo : NSObject

/**
 用户代码,默认:0
 */
@property (nonatomic, assign) NSUInteger code;

/**
 用户编号,默认:-1
 */
@property (nonatomic, assign) NSInteger userNo;

/**
 身高(m),默认:1.7m
 */
@property (nonatomic, assign) float height;

/**
 体重(kg),默认:60.0kg
 */
@property (nonatomic, assign) float weight;

/**
 年龄,默认:24
 */
@property (nonatomic, assign) NSUInteger age;

/**
 性别,默认:LSBSexTypeMale
 */
@property (nonatomic, assign) LSSexType sex;

/**
 人的类型,默认:LSPeopleTypeNormal
 */
@property (nonatomic, assign) LSPeopleType peopleType;

/**
 运动等级,范围:1-254,默认:1
 */
@property (nonatomic, assign) NSUInteger sportLevel;

/**
 目标类型,默认:LSBTargetTypeStep
 */
@property (nonatomic, assign) LSTargetType targetType;

/**
 手环目标值,默认:1000.0
 */
@property (nonatomic, assign) double targetValue;

@end
