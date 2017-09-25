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
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 150)];
    lineChart.showGenYLabels = false;
    lineChart.showSmoothLines = true;

    [lineChart setXLabels:@[@"第21周",@"第22周",@"第23周",@"第24周",@"第25周"]];
    
    // Line Chart No.1
    NSArray * data01Array = @[@6666, @1600, @12640, @26220, @1862];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.inflexionPointStyle = PNLineChartPointStyleNone;
    data01.inflexionPointColor = [UIColor redColor];
    data01.inflexionPointWidth = 6.f;
    data01.lineWidth = 4.f;
    data01.alpha = 1.f;
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
//    data01.showPointLabel = true;
    data01.pointLabelFont = [UIFont systemFontOfSize:10.f];
    data01.pointLabelColor = [UIColor blackColor];
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    lineChart.chartData = @[data01];
    lineChart.delegate = self;
    
    [lineChart strokeChart];
//    lineChart.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lineChart];
    
    NSLog(@"line1 = %@", lineChart.pathPoints);
    NSMutableArray *array = lineChart.pathPoints;
    for (NSArray *arr in array) {
        for (int i = 0; i < arr.count; i++) {
            CGPoint pt = [[arr objectAtIndex:i] CGPointValue];
            NSLog(@"%f", pt.x);
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(pt.x, 0, 1, lineChart.frame.size.height - 40)];
            line.backgroundColor = [UIColor lightGrayColor];
            [lineChart addSubview:line];
        }
    }
}


-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

@end
