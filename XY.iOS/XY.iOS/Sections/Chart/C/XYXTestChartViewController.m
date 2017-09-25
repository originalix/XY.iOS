//
//  XYXTestChartViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/25.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXTestChartViewController.h"
#import "SGStepLineChartView.h"

@interface XYXTestChartViewController ()

@end

@implementation XYXTestChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *xLabel = @[@"第21周",@"第22周",@"第23周",@"第24周",@"第25周"];
    NSArray *yLabel = @[@18000, @21000, @162340, @214567, @9000];
    SGStepLineChartView *chartView = [[SGStepLineChartView alloc] initWithFrame:CGRectMake(0, 100, 350, 180) XLabel:xLabel YLabel:yLabel];
    [self.view addSubview:chartView];
//    [chartView strokeChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
