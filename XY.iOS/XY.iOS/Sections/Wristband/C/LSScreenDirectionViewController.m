//
//  LSScreenDirectionViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/11.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "LSScreenDirectionViewController.h"

@interface LSScreenDirectionViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *scDirection;

@end

@implementation LSScreenDirectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"显示方向设置";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(selectTypeEvent)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)selectTypeEvent {
    LSScreenDirection type = LSScreenDirectionLandscape;
    if (_scDirection.selectedSegmentIndex == 1) {
        type = LSScreenDirectionPortrait;
    }
    
    [[[LSDeviceManager shared] getSettingManager] setScreenDirection:_device.deviceId direction:type callback:^(LSDeviceId deviceId, LSSettingCallBackCode code) {
        SGLog(@"设置屏幕方向 code = %ld", code);
    }];
}

@end
