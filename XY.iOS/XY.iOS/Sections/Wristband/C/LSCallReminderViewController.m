//
//  LSCallReminderViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/11.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "LSCallReminderViewController.h"

@interface LSCallReminderViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchEnable;
@property (nonatomic, strong) LSReminderCfg *config;

@end

@implementation LSCallReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_type == LSReminderTypeSMS)
    {
        self.title = @"短信提醒设置";
    }
    else if (_type == LSReminderTypeWechat)
    {
        self.title = @"微信提醒设置";
    }
    else if (_type == LSReminderTypeCall)
    {
        self.title = @"来电提醒设置";
    }
    else if (_type == LSReminderTypeMsg)
    {
        self.title = @"消息提醒";
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(onSetting)];
    
    self.switchEnable.on = self.config.enable;
    
}

- (LSReminderCfg *)config {
    if (!_config) {
        _config = [[LSReminderCfg alloc] init];
        _config.vibrationStyle = [[LSVibrationStyleCfg alloc] init];
    }
    
    return _config;
}

- (void)onSetting {
    self.config.type = _type;
    self.config.enable = _switchEnable.isOn;
    
    if (_type == LSReminderTypeCall) {
        self.config.vibrationStyle.intensity1 =6;
        self.config.vibrationStyle.intensity2 = 9;
        self.config.vibrationStyle.mode = LSVibrationModeWeak2Strong;
        self.config.vibrationStyle.delay = 3;
        self.config.vibrationStyle.duration = 8;
    }
    
    [[[LSDeviceManager shared] getSettingManager] setReminder:_device.deviceId reminderCfg:self.config callback:^(LSDeviceId deviceId, LSSettingCallBackCode code) {
        SGLog(@"消息提醒设置 code = %ld", code);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
