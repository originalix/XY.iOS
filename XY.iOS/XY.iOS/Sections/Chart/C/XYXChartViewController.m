//
//  XYXChartViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/22.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXChartViewController.h"
#import "PNChart.h"

@interface XYXChartViewController () <PNChartDelegate>

@end

@implementation XYXChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self forLineChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - PNChart
- (void)forLineChart {
    //For Line Chart
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    lineChart.showGenYLabels = false;
    lineChart.axisWidth = 10.f;
    lineChart.showSmoothLines = true;
//    lineChart.showYGridLines = YES;
//    lineChart.yGridLinesColor = [UIColor grayColor];
//    lineChart.showLabel = YES;
//    [lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    [lineChart setXLabels:@[@"第21周",@"第22周",@"第23周",@"第24周",@"第25周"]];
    
    // Line Chart No.1
    NSArray * data01Array = @[@6666, @1600, @12640, @26220, @1862];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.inflexionPointStyle = PNLineChartPointStyleCircle;
    data01.inflexionPointColor = [UIColor redColor];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
//    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
//    PNLineChartData *data02 = [PNLineChartData new];
//    data02.color = PNTwitterColor;
//    data02.itemCount = lineChart.xLabels.count;
//    data02.getData = ^(NSUInteger index) {
//        CGFloat yValue = [data02Array[index] floatValue];
//        return [PNLineChartDataItem dataItemWithY:yValue];
//    };
//
    lineChart.chartData = @[data01];
    lineChart.delegate = self;
    
    [lineChart strokeChart];
    [self.view addSubview:lineChart];
}


-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

@end
