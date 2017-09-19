//
//  XYLayerViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/19.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYLayerViewController.h"

@interface XYLayerViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation XYLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用图层
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//
//    [self.layerView.layer addSublayer:blueLayer];
    
    // contents 属性
    UIImage *image = [UIImage imageNamed:@"face"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
