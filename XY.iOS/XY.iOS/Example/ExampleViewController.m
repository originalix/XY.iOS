//
//  ExampleViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "ExampleViewController.h"
#import "SGHeartModel.h"
#import "LogObjcConst.h"
#import "SGHeartHelper.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testInsertDB];
//    [self testGetFromDB];
    
//    [self testInsertOriginTable];
    
//    [self testConverToByteArray];
//    [self testRealDataTest];
//    [WHC_ModelSqlite removeModel:[SGHeartTable class]];
//    [WHC_ModelSqlite removeModel:[SGHeartOriginTable class]];
//    [WHC_ModelSqlite removeModel:[SGHeartDetailsTable class]];
//    NSArray *array1 = [WHC_ModelSqlite query:[SGHeartTable class]];
//    NSLog(@"%@", array1);
//    NSArray *array = [SGHeartDetailsTable getDataWithDate:@"2017-06-30"];
//    NSLog(@"%@", array);
//    NSNumber *num = [SGHeartDetailsTable getMaxHeartWithDate:@"2017-06-30"];
//    NSLog(@"%@", num);
//    NSNumber *min = [SGHeartDetailsTable getMinHeartWithDate:@"2017-06-30"];
//    NSLog(@"%@", min);
////    [SGHeartOriginTable checkNotUploadData];
////    [SGHeartTable cleanHeartData];
////    [self record];
//    NSLog(@"%@", [WHC_ModelSqlite localPathWithModel:[SGHeartTable class]]);
    [self testConvertHEX];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)record {
    NSString *measureTime = @"2017-06-30 09:24:59";
    NSString *srcData = @"6555513e494e54544a41463f4258575a";
    if (! [SGHeartTable checkRepeatDataWithTime:measureTime]) {
        SGHeartTable *t1 = [[SGHeartTable alloc] initWithMeasureTime:measureTime];
        [WHC_ModelSqlite insert:t1];
    }
    
    NSString *queryHeartID = [NSString stringWithFormat:@"date = '%@'", [SGHeartHelper formatMeasureTime:measureTime]];
    NSArray *heartTable = [WHC_ModelSqlite query:[SGHeartTable class] where:queryHeartID];
    if (! heartTable) {
        return;
    }
    SGHeartTable *heartModel = heartTable.firstObject;
    if ([SGHeartOriginTable checkRepeatDataWithTime:measureTime]) {
        return;
    }
    SGHeartOriginTable *originModel = [[SGHeartOriginTable alloc] initWithHeartID:heartModel._id srcData:srcData date:measureTime];
    [WHC_ModelSqlite insert:originModel];
    [originModel convertSrcDataToModel];
}

- (void)testInsertDB {
    SGHeartTable *t1 = [[SGHeartTable alloc] initWithMeasureTime:@"2017-06-30 10:44:59"];
    [WHC_ModelSqlite insert:t1];
}

- (void)testGetFromDB {
    NSArray *array = [WHC_ModelSqlite query:[SGHeartTable class]];
    for (SGHeartTable *model in array) {
        NSLog(@"%@", model);
    }
    
    NSArray *array1 = [WHC_ModelSqlite query:[SGHeartOriginTable class]];
    for (SGHeartOriginTable *model in array1) {
        NSLog(@"%@", model);
    }
}

- (void)testInsertOriginTable {
    NSArray *array = [WHC_ModelSqlite query:[SGHeartTable class] where:@"date = '2017-06-30'"];
    SGHeartTable *model = array.lastObject;
    SGHeartOriginTable *ot1 = [[SGHeartOriginTable alloc] initWithHeartID:model._id srcData:@"6555513e494e54544a41463f4258575a" date:@"2017-06-30 09:24:59"];
    [WHC_ModelSqlite insert:ot1];
}

- (void)testConverToByteArray {
    NSArray *array = [WHC_ModelSqlite query:[SGHeartOriginTable class]];
    for (SGHeartOriginTable *model in array) {
        [model convertSrcDataToModel];
    }
}

- (void)testRealDataTest {
    NSString *srcData = @"46465b5a55464146494a605445474c3d4538455353495b52534e430000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    SGHeartOriginTable *model = [[SGHeartOriginTable alloc] init];
    model.srcData = srcData;
    model.date = @"2017-06-29 18:04:59";
    [model convertSrcDataToModel];
}

- (void)testConvertHEX {
    NSData *data = [SGHeartHelper convertHexStrToData:@"400"];
    NSString *str = [SGHeartHelper convertDataToHexStr:data];
    NSLog(@"%@", str);
}



@end


//@interface SGHeartTable : NSObject
//
//@property (nonatomic, assign) NSInteger _id;
//@property (nonatomic, copy) NSString *date;
//@property (nonatomic, copy) NSString *created_at;
//@property (nonatomic, copy) NSString *updated_at;
//
//@end
//
//@interface SGHeartOriginTable : NSObject
//
//@property (nonatomic, copy) NSString *srcData;
//@property (nonatomic, copy) NSString *date;
//@property (nonatomic, assign) NSInteger timestamp;
//@property (nonatomic, copy) NSString *created_at;
//@property (nonatomic, copy) NSString *updated_at;
//
//@end
//
//@interface SGHeartDetailsTable : NSObject
//
//@property (nonatomic, assign) NSInteger dataID;
//@property (nonatomic, assign) NSInteger heart;
//@property (nonatomic, copy) NSString *time;
//@property (nonatomic, copy) NSString *timestamp;
//@property (nonatomic, copy) NSString *created_at;
//
//@end
