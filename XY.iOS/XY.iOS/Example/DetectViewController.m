//
//  DetectViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/7/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "DetectViewController.h"
#import <iflyMSC/IFlyFaceSDK.h>

@interface DetectViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IFlyFaceDetector *faceDetector;

@end

@implementation DetectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"face"];
    self.imageView.image = image;
    self.faceDetector = [IFlyFaceDetector sharedInstance];
    [self.faceDetector setParameter:@"1" forKey:@"align"];
    [self.faceDetector setParameter:@"1" forKey:@"detect"];
    NSString *rs = [self.faceDetector detectARGB:self.imageView.image];
    NSLog(@"!--> !! %@", rs);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
