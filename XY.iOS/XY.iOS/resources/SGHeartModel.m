//
//  SGHeartModel.m
//  SGHome
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 State Grid. All rights reserved.
//

#import "SGHeartModel.h"
#import "SGHeartHelper.h"

@implementation SGHeartModel

@end

@implementation SGHeartTable

- (instancetype)initWithMeasureTime:(NSString *)time {
    self = [super init];
    if (self) {
        self.date = [SGHeartHelper formatMeasureTime:time];
        self.created_at = [SGHeartHelper formatCurrentTime];
        self.updated_at = [SGHeartHelper formatCurrentTime];
    }
    return self;
}

//2017-06-30 10:44:59
@end

@implementation SGHeartOriginTable

@end

@implementation SGHeartDetailsTable

@end
