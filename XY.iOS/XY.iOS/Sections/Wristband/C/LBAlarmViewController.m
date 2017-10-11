//
//  LBAlarmViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/11.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "LBAlarmViewController.h"

@interface LBAlarmViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchEnable;

@end

@implementation LBAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"闹钟设置";
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingEvent)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)settingEvent {
    LSAlarmClockCfg *alarmConfig = [[LSAlarmClockCfg alloc] init];
    alarmConfig.index = 1;
    alarmConfig.label = @"起床";
    alarmConfig.enable = self.switchEnable.isOn;
    alarmConfig.weeks = @"1111100";
    alarmConfig.startHour = 12;
    alarmConfig.startMin = 30;
    alarmConfig.vibrationStyle.intensity1 =6;
    alarmConfig.vibrationStyle.intensity2 = 9;
    alarmConfig.vibrationStyle.mode = LSVibrationModeWeak2Strong;
    alarmConfig.vibrationStyle.delay = 3;
    alarmConfig.vibrationStyle.duration = 8;
    
    [[[LSDeviceManager shared] getSettingManager] setAlaramClock:_device.deviceId clock:alarmConfig callback:^(LSDeviceId deviceId, LSSettingCallBackCode code) {
        SGLog(@"闹钟设置 code = %ld", code);
    }];
}

@end
