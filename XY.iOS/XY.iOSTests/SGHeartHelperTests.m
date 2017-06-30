//
//  SGHeartHelperTests.m
//  XY.iOS
//
//  Created by Lix on 2017/6/30.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SGHeartHelper.h"

@interface SGHeartHelperTests : XCTestCase

@end

@implementation SGHeartHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (void)testFormatMeasureTime {
    NSString *dataStr = [SGHeartHelper formatMeasureTime:@"2017-12-31 23:59:59"];
    BOOL check = [dataStr isEqualToString:@"2017-12-31"];
    XCTAssertTrue(check, @"时间验证失败");
}

- (void)testBaseFormatFunc {
    NSString *test = [SGHeartHelper convertTimeBeforeFormat:@"yyyy-MM-dd HH:mm:ss" convertFormat:@"HH-mm" timeStr:@"2016-12-01 12:21:21"];
    BOOL check = [test isEqualToString:@"12-21"];
    XCTAssertTrue(check, @"时间验证失败");
}

@end
