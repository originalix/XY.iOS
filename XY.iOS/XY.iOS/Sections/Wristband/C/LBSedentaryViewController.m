//
//  LBSedentaryViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/11.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "LBSedentaryViewController.h"

@interface LBSedentaryViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchEnable;

@end

@implementation LBSedentaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"久坐设置";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingEvent)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.switchEnable.on = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)settingEvent {
    LSSedentaryCfg *config = [[LSSedentaryCfg alloc] init];
    config.index = 0;
    config.enable = true;
    config.enable = self.switchEnable.isOn;
    config.weeks = @"1111100";
    config.startHour = 9;
    config.startMin = 0;
    config.endHour = 17;
    config.endMin = 0;
    config.interval = 1;
    config.vibrationStyle.intensity1 =6;
    config.vibrationStyle.intensity2 = 9;
    config.vibrationStyle.mode = LSVibrationModeWeak2Strong;
    config.vibrationStyle.delay = 3;
    config.vibrationStyle.duration = 8;
    
    [[[LSDeviceManager shared] getSettingManager] setSedentary:_device.deviceId sedentary:config callback:^(LSDeviceId deviceId, LSSettingCallBackCode code) {
        SGLog(@"久坐提醒设置  code = %ld", code);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
