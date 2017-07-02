//
//  SGHeartModel.h
//  SGHome
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 State Grid. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SGHeartModel, SGHeartTable, SGHeartOriginTable, SGHeartDetailsTable;

@interface SGHeartModel : NSObject

@end

@interface SGHeartTable : NSObject

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *updated_at;

- (instancetype)initWithMeasureTime:(NSString *)time;
+ (BOOL)checkRepeatDataWithTime:(NSString *)time;

@end

@interface SGHeartOriginTable : NSObject

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, assign) NSInteger heartID;
@property (nonatomic, copy) NSString *srcData;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, copy) NSString *updated_at;
@property (nonatomic, assign) NSInteger done;

- (instancetype)initWithHeartID:(NSInteger)heartID srcData:(NSString *)srcData date:(NSString *)date;
- (void)convertSrcDataToModel;
+ (BOOL)checkRepeatDataWithTime:(NSString *)time;

@end

@interface SGHeartDetailsTable : NSObject

@property (nonatomic, assign) NSInteger heartID;
@property (nonatomic, assign) NSInteger heart;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, copy) NSString *updated_at;

- (instancetype)initWithHeartID:(NSInteger)heartID heart:(NSInteger)heart time:(NSString *)time timestamp:(NSInteger)timestamp;
+ (NSArray *)getDataWithDate:(NSString *)date;
+ (NSNumber *)getMaxHeartWithDate:(NSString *)date;
+ (NSNumber *)getMinHeartWithDate:(NSString *)date;

@end
