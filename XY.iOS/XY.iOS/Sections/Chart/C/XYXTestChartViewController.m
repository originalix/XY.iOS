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

@interface XYXTestChartViewController ()

@end

@implementation XYXTestChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"计步";
    [self setupLineChartView];
    [self screenshotCapture];
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
    UIImage *img = [self imageFromView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    CGFloat ScreenWidth = [[UIScreen mainScreen] bounds].size.width;
    [imgView setFrame:CGRectMake(0, 300, ScreenWidth,  300)];
    [self.view addSubview:imgView];
}

//获得屏幕图像
- (UIImage *)imageFromView:(UIView *)view {
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

 //获得某个范围内的屏幕图像
 - (UIImage *)imageFromView:(UIView *)view atFrame:(CGRect)rect {
     UIGraphicsBeginImageContext(view.frame.size);
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSaveGState(context);
     UIRectClip(rect);
     [view.layer renderInContext:context];
     
     UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     return theImage;
}

-(void)fullScreenshots {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *screenWindow = appDelegate.window;
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil); //将截图存入相册
}

@end
