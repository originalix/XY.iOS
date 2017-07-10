//
//  CameraController.m
//  XY.iOS
//
//  Created by Lix on 2017/7/7.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "CameraController.h"
#import <iflyMSC/IFlyFaceSDK.h>

@interface CameraController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IFlyFaceDetector *faceDetector;

@end

@implementation CameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"face1"];
    self.imageView.image = image;
    self.faceDetector = [IFlyFaceDetector sharedInstance];
    [self.faceDetector setParameter:@"1" forKey:@"detect"];
    [self imageDetector];
}

- (void)imageDetector {
    NSString *rs = [self.faceDetector detectARGB:[self.imageView image]];
    NSLog(@"result = %@", rs);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
