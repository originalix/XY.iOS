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
        [self insertToDetailsTableWithData:byteArr[i] index:i baseTimestamp:baseTimestamp];
    }
}

- (void)insertToDetailsTableWithData:(NSInteger)data index:(NSInteger)index baseTimestamp:(NSInteger)baseTimestamp {
    if (data < 1) {
        return;
    }
    NSInteger timestamp = baseTimestamp + (index * 300);
    NSString *sql = [NSString stringWithFormat:@"timestamp = '%ld'", timestamp];
    NSArray *result = [WHC_ModelSqlite query:[SGHeartDetailsTable class] where: sql];
    if (result.count > 0) {
        return;
    }
    NSString *date = [SGHeartHelper convertToDateStrWithTimestamp:timestamp];
    SGHeartDetailsTable *detailsModel = [[SGHeartDetailsTable alloc] initWithHeartID:self.heartID heart:data time:date timestamp:timestamp];
    [WHC_ModelSqlite insert:detailsModel];
    NSLog(@"数据库插入数据 -> heartID = %ld, data = %ld, time = %@, timestamp = %ld", self.heartID, (long)data, date, timestamp);
}

@end

@implementation SGHeartDetailsTable

- (instancetype)initWithHeartID:(NSInteger)heartID heart:(NSInteger)heart time:(NSString *)time timestamp:(NSInteger)timestamp {
    self = [super init];
    if (self) {
        self.heartID = heartID;
        self.heart = heart;
        self.time = time;
        self.timestamp = timestamp;
        self.updated_at = [SGHeartHelper formatCurrentTime];
    }
    
    return self;
}

+ (NSArray *)getDataWithDate:(NSString *)date {
    NSArray *detailsResults = [NSArray array];
    NSString *queryHeartTableSql = [NSString stringWithFormat:@"date = '%@'", date];
    NSArray *results = [WHC_ModelSqlite query:[SGHeartTable class] where: queryHeartTableSql];
    if (!results.count) {
        return detailsResults;
    }
    SGHeartTable *heartModel = [results firstObject];
    NSString *detailsSql = [NSString stringWithFormat:@"heartID = '%ld'", heartModel._id];
    detailsResults = [WHC_ModelSqlite query:[SGHeartDetailsTable class] where:detailsSql order:@"by _id asc"];
    return detailsResults;
}

@end
