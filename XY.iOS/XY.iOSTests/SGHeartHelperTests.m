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
    NSString *dataStr = [SGHeartHelper formatMeasureTime:@"2017-06-30 10:44:59"];
    BOOL check = [dataStr isEqualToString:@"2017-06-30"];
    XCTAssertTrue(check, @"时间验证失败");
}

@end
