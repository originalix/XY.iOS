//
//  SGStepLineChartView.m
//  XY.iOS
//
//  Created by Lix on 2017/9/25.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "SGStepLineChartView.h"
#import "PNChart.h"
#import "PNChartLabel.h"

#define kInflexionPointColor [UIColor redColor]
#define kLineColor PNFreshGreen

static const CGFloat kInflexionPointWidth = 6.f;
static const CGFloat kLineWidth = 4.f;

@interface SGStepLineChartView() <PNChartDelegate>

@property (nonatomic, strong) PNLineChart *lineChart;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) NSMutableArray *pointViewArray;

@end

@implementation SGStepLineChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lineChart = [[PNLineChart alloc] initWithFrame:frame];
        [self p_setupLineView];
    }
    return self;
}

- (void)p_setupLineView {
    _lineChart.showGenYLabels = false;
    _lineChart.showSmoothLines = true;
    [_lineChart setXLabels:self.xLabels];
    PNLineChartData *data = [PNLineChartData new];
    data.inflexionPointStyle = PNLineChartPointStyleNone;
    data.inflexionPointColor = kInflexionPointColor;
    data.inflexionPointWidth = kInflexionPointWidth;
    data.lineWidth = kLineWidth;
    data.alpha = 1.f;
    data.color = kLineColor;
    data.itemCount = _lineChart.xLabels.count;
    data.getData = ^(NSUInteger index) {
        CGFloat yValue = [self.dataSource[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    _lineChart.chartData = @[data];
    _lineChart.delegate = self;
}

- (void)strokeChart {
    [self.lineChart strokeChart];
}



@end
