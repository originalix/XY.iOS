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
        self.updated_at = [SGHeartHelper formatCurrentTime];
    }
    
    return self;
}

//2017-06-30 10:44:59
@end

@implementation SGHeartOriginTable

- (instancetype)initWithHeartID:(NSInteger)heartID srcData:(NSString *)srcData date:(NSString *)date {
    self = [super init];
    if (self) {
        self.heartID = heartID;
        self.srcData = srcData;
        self.date = date;
        self.timestamp = [SGHeartHelper convertToTimestamp:date format:@"yyyy-MM-dd HH:mm:ss"];
        self.updated_at = [SGHeartHelper formatCurrentTime];
    }
    
    return self;
}

- (void)convertSrcDataToModel {
    NSData *data = [SGHeartHelper convertHexStrToData:self.srcData];
    Byte *byteArr = (Byte *)[data bytes];
    NSInteger baseTimestamp = [SGHeartHelper convertToTimestamp:self.date format:@"yyyy-MM-dd HH:mm:ss"];
    for (int i = 0; i < [data length]; i++) {
        printf("byteArr = %d\n",byteArr[i]);
        NSInteger timestamp = baseTimestamp + (i * 300);
        printf("byte Timestamp = %ld", (long)timestamp);
    }
}

@end

@implementation SGHeartDetailsTable

@end
