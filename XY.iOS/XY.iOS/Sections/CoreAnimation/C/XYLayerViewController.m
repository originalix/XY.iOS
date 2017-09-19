//
//  XYLayerViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/19.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYLayerViewController.h"

@interface XYLayerViewController ()<CALayerDelegate>

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation XYLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 使用图层
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//
//    [self.layerView.layer addSublayer:blueLayer];
    
    // contents 属性
//    UIImage *image = [UIImage imageNamed:@"face"];
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//
//    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.layerView.layer.masksToBounds = true;
//
//    [self addSpriteImage:image withContentRect:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.layerView.layer];
    
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:blueLayer];
    [blueLayer display];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
//    layer.contentsRect = rect;
    layer.contentsCenter = rect;
}

#pragma mark - CALayerDelegate
//- (void)displayLayer:(CALayer *)layer {
//    NSLog(@"%@%s", layer,__func__);
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"%s", __func__);
    CGContextSetLineWidth(ctx, 10.f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

@end
