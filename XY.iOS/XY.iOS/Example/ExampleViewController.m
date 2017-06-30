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

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testGetFromDB];
    
    NSLog(@"%@", [WHC_ModelSqlite localPathWithModel:[SGHeartTable class]]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testInsertDB {
    SGHeartTable *t1 = [[SGHeartTable alloc] init];
    t1.date = @"2017-06-30";
    t1.created_at = @"2017-06-30";
    t1.updated_at = @"2017-06-30";
    [WHC_ModelSqlite insert:t1];
}

- (void)testGetFromDB {
    NSArray *array = [WHC_ModelSqlite query:[SGHeartTable class]];
    for (SGHeartTable *model in array) {
        NSLog(@"%@", model);
    }
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
