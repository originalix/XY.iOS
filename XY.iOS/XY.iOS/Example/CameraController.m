//
//  CameraController.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "CameraController.h"

@interface CameraController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"face"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
