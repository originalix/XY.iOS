//
//  XYXChartViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/22.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXChartViewController.h"
#import "PNChart.h"
#import "PNChartLabel.h"

@interface XYXChartViewController () <PNChartDelegate>

@property (nonatomic, strong) PNLineChart *lineChart;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) NSMutableArray *pointArray;

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
    _lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 150)];
    _lineChart.showGenYLabels = false;
    _lineChart.showSmoothLines = true;

    [_lineChart setXLabels:@[@"第21周",@"第22周",@"第23周",@"第24周",@"第25周"]];
    
    // Line Chart No.1
    NSArray * data01Array = @[@0, @0, @0, @0, @0];
    self.dataSource = [NSMutableArray arrayWithArray:data01Array];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.inflexionPointStyle = PNLineChartPointStyleNone;
    data01.inflexionPointColor = [UIColor redColor];
    data01.inflexionPointWidth = 6.f;
    data01.lineWidth = 4.f;
    data01.alpha = 1.f;
    data01.color = PNFreshGreen;
    data01.itemCount = _lineChart.xLabels.count;
//    data01.showPointLabel = true;
    data01.pointLabelFont = [UIFont systemFontOfSize:10.f];
    data01.pointLabelColor = [UIColor blackColor];
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    _lineChart.chartData = @[data01];
    _lineChart.delegate = self;
    
    [_lineChart strokeChart];
//    lineChart.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_lineChart];
    
    NSLog(@"line1 = %@", _lineChart.pathPoints);
    NSMutableArray *array = _lineChart.pathPoints;
    for (NSArray *arr in array) {
        self.pointArray = [NSMutableArray array];
        for (int i = 0; i < arr.count; i++) {
            CGPoint pt = [[arr objectAtIndex:i] CGPointValue];
            NSLog(@"%f", pt.x);
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(pt.x, 0, 1, _lineChart.frame.size.height - 40)];
            line.backgroundColor = [UIColor lightGrayColor];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
            tap.numberOfTapsRequired = 1;
            tap.numberOfTouchesRequired = 1;
            [line addGestureRecognizer:tap];

            
            [_lineChart addSubview:line];
            
            UIView *cicle = [[UIView alloc] initWithFrame:CGRectMake(pt.x - 2.5, pt.y - 2.5, 5, 5)];
            cicle.layer.masksToBounds = true;
            cicle.layer.cornerRadius = 3.f;
            cicle.backgroundColor = [UIColor redColor];
            [self.pointArray addObject:cicle];
            [_lineChart addSubview:cicle];
        }
    }
    
    _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _dataLabel.backgroundColor = [UIColor clearColor];
    _dataLabel.font = [UIFont systemFontOfSize:13.f];
    _dataLabel.textAlignment = NSTextAlignmentCenter;
    [_lineChart addSubview:_dataLabel];
    
}

-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
    NSMutableArray *array = _lineChart.pathPoints;
    for (NSArray *arr in array) {
        CGPoint pt = [[arr objectAtIndex:pointIndex] CGPointValue];
        NSLog(@"%f", pt.x);
        self.dataLabel.text = [NSString stringWithFormat:@"%@", [self.dataSource objectAtIndex:pointIndex]];
        [self.dataLabel setFrame:CGRectMake(pt.x - 25, pt.y - 29, 50, 40)];
    }
    
    NSLog(@"xLabel = %@", _lineChart.xLabels);
    NSLog(@"x pointLabel = %@", _lineChart.xChartLabels);
    
    PNChartLabel *chartLabel = [_lineChart.xChartLabels objectAtIndex:pointIndex];
    chartLabel.textColor = [UIColor redColor];
    
    UIView *pointView = [self.pointArray objectAtIndex:pointIndex];
    [pointView removeFromSuperview];
    pointView.backgroundColor = [UIColor yellowColor];
    [_lineChart addSubview:pointView];
}

-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

- (void)tapAction {
}

- (void)showLinesPoint {
    NSMutableArray *array = _lineChart.pathPoints;
    for (NSArray *arr in array) {
        for (int i = 0; i < arr.count; i++) {
            CGPoint pt = [[arr objectAtIndex:i] CGPointValue];
            NSLog(@"%f", pt.x);
        }
    }
}

#pragma mark --- UITapGestureRecognizer 轻拍手势事件 ---

-(void)tapView:(UITapGestureRecognizer *)sender{
    NSLog(@"Hello world");
}

@end
