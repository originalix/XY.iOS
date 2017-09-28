//
//  XYXTestChartViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/25.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYXTestChartViewController.h"
#import "SGStepLineChartView.h"
#import "XY_iOS-Swift.h"
#import "SwViewCapture-Swift.h"
#import "XYXImageViewController.h"

@interface XYXTestChartViewController ()

@end

@implementation XYXTestChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"计步";
    [self setupLineChartView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Capture" style:UIBarButtonItemStylePlain target:self action:@selector(screenshotCapture)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - initialize for line chart view
- (void)setupLineChartView {
    NSMutableArray *xLabel = [NSMutableArray array];
    NSMutableArray *yLabel = [NSMutableArray array];
    NSInteger N = 7;
    for (int i = 1; i <= N; i++) {
        [xLabel addObject: [NSString stringWithFormat:@"第%d周", i]];
        NSNumber *step = [NSNumber numberWithInteger: arc4random() % 200000];
        [yLabel addObject: step];
    }
    CGFloat ScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    SGStepLineChartView *chartView = [[SGStepLineChartView alloc] initWithFrame:CGRectMake(0, 75, ScreenWidth, 150) XLabel:xLabel YLabel:yLabel];
    [self.view addSubview:chartView];
}

- (void)screenshotCapture {
    [self.view swCapture:^(UIImage * _Nullable image) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        XYXImageViewController *vc = [[XYXImageViewController alloc] init];
        vc.image = image;
        [self.navigationController pushViewController:vc animated:true];
    }];
}

@end
