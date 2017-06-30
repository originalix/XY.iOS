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
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *updated_at;

- (instancetype)initWithMeasureTime:(NSString *)time;

@end

@interface SGHeartOriginTable : NSObject

@property (nonatomic, copy) NSString *srcData;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *updated_at;

@end

@interface SGHeartDetailsTable : NSObject

@property (nonatomic, assign) NSInteger dataID;
@property (nonatomic, assign) NSInteger heart;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *created_at;

@end
