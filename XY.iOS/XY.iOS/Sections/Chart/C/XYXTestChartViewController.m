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
    NSMutableArray *xLabel = [NSMutableArray array];
    NSMutableArray *yLabel = [NSMutableArray array];
    NSInteger N = 100;
    for (int i = 1; i <= N; i++) {
        [xLabel addObject: [NSString stringWithFormat:@"第%d周", i]];
        NSNumber *step = [NSNumber numberWithInteger: arc4random() % 200000];
        [yLabel addObject: step];
    }
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    SGStepLineChartView *chartView = [[SGStepLineChartView alloc] initWithFrame:CGRectMake(0, 100, screenWidth, 180) XLabel:xLabel YLabel:yLabel];
    [self.view addSubview:chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
