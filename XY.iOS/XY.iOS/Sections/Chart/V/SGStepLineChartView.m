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
#define kSublineColor [UIColor lightGrayColor]
#define kCicleColor [UIColor redColor]
#define kSelectedLabelColor [UIColor redColor]
#define kDeSelectedLabelColor [UIColor blackColor]

static const CGFloat kInflexionPointWidth = 6.f;
static const CGFloat kLineWidth = 6.f;
static const NSInteger kMaxIndex = 9999;

@interface SGStepLineChartView() <PNChartDelegate>

@property (nonatomic, strong) PNLineChart *lineChart;
@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) NSMutableArray *pointViewArray;
@property (nonatomic, assign) NSInteger oldSelectedIndex;

@end

@implementation SGStepLineChartView

#pragma mark - initialize
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame XLabel:(NSArray *)xLabel YLabel:(NSArray *)yLabel {
    self = [super initWithFrame:frame];
    if (self) {
        _lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.xLabels = xLabel;
        self.dataSource = yLabel;
        [self p_setupLineView];
        _oldSelectedIndex = kMaxIndex;
    }
    return self;
}

/**
 重绘折线图
 */
- (void)strokeChart {
    [self.lineChart strokeChart];
}

#pragma mark - 创建折线图View
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
    [_lineChart strokeChart];
    [self addSubview: _lineChart];
    [self p_setupCicleViewAndSublineView];
}

- (void)p_setupCicleViewAndSublineView {
    for (NSArray *arr in self.lineChart.pathPoints) {
        self.pointViewArray = [NSMutableArray array];
        NSLog(@"%@", arr);
        for (int i = 0; i < [arr count]; i++) {
            CGPoint point = [[arr objectAtIndex:i] CGPointValue];
            [self p_createCicleViewAndSublineViewWithPoint:point];
        }
    }
    _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _dataLabel.backgroundColor = [UIColor clearColor];
    
    static const CGFloat kDataLabelFontSize = 13.f;
    
    _dataLabel.font = [UIFont systemFontOfSize:kDataLabelFontSize];
    _dataLabel.textAlignment = NSTextAlignmentCenter;
    [self.lineChart addSubview:_dataLabel];
}

- (void)p_createCicleViewAndSublineViewWithPoint:(CGPoint)point {
    
    static const CGFloat kSublineBottomMargin = 40.f;
    static const CGFloat kSublineWidth = 1.f;
    static const CGFloat kCicleWidth = 10.f;
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(point.x, 0, kSublineWidth, _lineChart.frame.size.height - kSublineBottomMargin)];
    lineView.backgroundColor = kSublineColor;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(strokeChart)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [lineView addGestureRecognizer:tapGesture];
    
    [self.lineChart addSubview:lineView];
    
    UIView *cicleView = [[UIView alloc] initWithFrame:CGRectMake(point.x - kCicleWidth / 2, point.y - kCicleWidth / 2, kCicleWidth, kCicleWidth)];
    cicleView.layer.masksToBounds = true;
    cicleView.layer.cornerRadius = 6.f;
    cicleView.backgroundColor = kCicleColor;
    [self.pointViewArray addObject:cicleView];
    
    [self.lineChart addSubview:cicleView];
}

#pragma mark - PNChartDelegate
- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex {
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
    [self p_refreshSelectedViewWithPointIndex:pointIndex];
}

- (void)p_refreshSelectedViewWithPointIndex:(NSInteger)pointIndex {
    
    static const CGFloat kDataLabelWidth = 50.f;
    static const CGFloat kDataLabelHeight = 40.f;
    static const CGFloat kDataLabelOffSetX = 25.f;
    static const CGFloat kDataLabelOffSetY = 32.f;
    
    if (_oldSelectedIndex < kMaxIndex) {
        // 恢复之前View状态
        [self p_selectedChartLabelWithIndex:_oldSelectedIndex Selected:false];
    }
    
    _oldSelectedIndex = pointIndex;
    
    for (NSArray *arr in self.lineChart.pathPoints) {
        CGPoint point = [[arr objectAtIndex:pointIndex] CGPointValue];
        self.dataLabel.text = [NSString stringWithFormat:@"%@", [self.dataSource objectAtIndex:pointIndex]];
        [self.dataLabel setFrame:CGRectMake(point.x - kDataLabelOffSetX, point.y - kDataLabelOffSetY, kDataLabelWidth, kDataLabelHeight)];
    }
    
    [self p_selectedChartLabelWithIndex:pointIndex Selected:true];
}

- (void)p_selectedChartLabelWithIndex:(NSInteger)pointIndex Selected:(BOOL)selected {
    PNChartLabel *chartLabel = [self.lineChart.xChartLabels objectAtIndex:pointIndex];
    UIView *pointView = [self.pointViewArray objectAtIndex:pointIndex];
    [pointView removeFromSuperview];
    if (!selected) {
        chartLabel.textColor = kDeSelectedLabelColor;
        pointView.backgroundColor = [UIColor redColor];
    } else {
        chartLabel.textColor = kSelectedLabelColor;
        pointView.backgroundColor = kSelectedLabelColor;
    }
    [self.lineChart addSubview:pointView];
}

@end
