//
//  EffictiveObjc.m
//  XY.iOS
//
//  Created by Lix on 2017/8/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "EffictiveObjc.h"

#define ANIMATION_DURATION 0.3 //NOT GOOD

static const NSTimeInterval kAnimationDuration = 0.3; //GOOD

//if need be public const
NSString *const EFCStringConstant = @"VALUE";

@interface EffictiveObjc()

@end

@implementation EffictiveObjc

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
