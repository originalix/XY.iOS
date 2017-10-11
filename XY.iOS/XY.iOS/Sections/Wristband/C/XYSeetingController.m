//
//  XYSeetingController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSeetingController.h"
#import "LSScreenDirectionViewController.h"

static NSString *KUpgrade=@"设备升级";
static NSString *KRemoveDevice=@"删除设备";
static NSString *KPairDevice=@"睡眠分析";
static NSString *KSedentary=@"久坐提醒设置";
static NSString *KAlarm=@"闹钟提醒设置";
static NSString *KMessage=@"消息提醒设置";
static NSString *KCall=@"来电提醒";
static NSString *KSMS=@"短信提醒";
static NSString *KWeChat=@"微信提醒";
static NSString *KHeart=@"心率设置";
static NSString *KHeartRange=@"心率区间设置";
static NSString *KHeartAlert=@"心率区间预警设置";
static NSString *KNightMode=@"夜间模式设置";
static NSString *KWearingWay=@"手环佩戴方式设置";
static NSString *KScreenDirection=@"屏幕方向";
static NSString *KScreenContent=@"屏幕内容设置";
static NSString *KUserInformation=@"用户信息设置";
static NSString *KEncourageTarget=@"鼓励目标设置";
static NSString *KGPS=@"GPS状态设置";
static NSString *KTimeUnit=@"时间单位设置";
static NSString *KLengthUnit=@"长度单位设置";
static NSString *KWeather = @"天气设置";
static NSString *KDial = @"表盘设置";

// weight scale
static NSString *KWSTime = @"称时间设置";
static NSString *KWSTarget = @"称目标设置";
static NSString *KWSUnit = @"称单位设置";
static NSString *KWSSynMeasureData = @"称同步测量数据设置";

@interface XYSeetingController ()

@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation XYSeetingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [NSMutableArray array];
    [self creatData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)creatData {
    
    [self.dataSource addObject:KUpgrade];
    [self.dataSource addObject:KRemoveDevice];
    [self.dataSource addObject:KPairDevice];
    
    for (LSBaseFunction *functionClass in self.detailInfo.functions)
    {
        if ([functionClass isKindOfClass:[LSSedentaryFunction class]])
        {
            [self.dataSource addObject:KSedentary];
        }
        else if ([functionClass isKindOfClass:[LSWeatherFunction class]])
        {
            [self.dataSource addObject:KWeather];
            
        }
        else if ([functionClass isKindOfClass:[LSAlarmClockFunction class]])
        {
            [self.dataSource addObject:KAlarm];
        }
        else if ([functionClass isKindOfClass:[LSNightModeFunction class]])
        {
            [self.dataSource addObject:KNightMode];
        }
        else if ([functionClass isKindOfClass:[LSReminderFunction class]])
        {
            LSReminderFunction *remind = (LSReminderFunction *)functionClass;
            for (NSNumber *type in remind.reminderTypes) {
                LSReminderType remindType = (LSReminderType)[type intValue];
                switch (remindType) {
                    case LSReminderTypeCall:
                        [self.dataSource addObject:KCall];
                        break;
                    case LSReminderTypeMsg:
                        [self.dataSource addObject:KMessage];
                        break;
                    case LSReminderTypeSMS:
                        [self.dataSource addObject:KSMS];
                        break;
                    case LSReminderTypeWechat:
                        [self.dataSource addObject:KWeChat];
                        break;
                    default:
                        break;
                }
            }
        }
        else if ([functionClass isKindOfClass:[LSHeartRateMeasureFunction class]])
        {
            [self.dataSource addObject:KHeart];
        }
        else if ([functionClass isKindOfClass:[LSHeartRateRangeFunction class]])
        {
            [self.dataSource addObject:KHeartRange];
        }
        else if ([functionClass isKindOfClass:[LSHeartRateAlertFunction class]])
        {
            [self.dataSource addObject:KHeartAlert];
        }
        else if ([functionClass isKindOfClass:[LSWristStyleFunction class]])
        {
            [self.dataSource addObject:KWearingWay];
        }
        else if ([functionClass isKindOfClass:[LSScreenDirectionFunction class]])
        {
            [self.dataSource addObject:KScreenDirection];
        }
        else if ([functionClass isKindOfClass:[LSScreenContentFunction class]])
        {
            [self.dataSource addObject:KScreenContent];
        }
        else if ([functionClass isKindOfClass:[LSUserInfoFunction class]])
        {
            [self.dataSource addObject:KUserInformation];
        }
        else if ([functionClass isKindOfClass:[LSEncourageFunction class]])
        {
            [self.dataSource addObject:KEncourageTarget];
        }
        else if ([functionClass isKindOfClass:[LSGPSFunction class]])
        {
            [self.dataSource addObject:KGPS];
        }
        else if ([functionClass isKindOfClass:[LSHourFormatFunction class]])
        {
            [self.dataSource addObject:KTimeUnit];
        }
        else if ([functionClass isKindOfClass:[LSDistanceUnitFunction class]])
        {
            [self.dataSource addObject:KLengthUnit];
        }
        else if ([functionClass isKindOfClass:[LSDialStyleFunction class]])
        {
            [self.dataSource addObject:KDial];
        }
        
        else if ([functionClass isKindOfClass:[LSWeightTargetFunction class]])
        {
            [self.dataSource addObject:KWSTarget];
        }
        else if ([functionClass isKindOfClass:[LSWeightUnitFunction class]])
        {
            [self.dataSource addObject:KWSUnit];
        }
        
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSString *valueStr = self.dataSource[indexPath.row];
    if ([valueStr isEqualToString:KRemoveDevice]) {
        [self onDeleteDevice];
    } else if ([valueStr isEqualToString:KScreenDirection]) {
        LSScreenDirectionViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LSScreenDirectionViewController"];
        vc.device = _device;
        [self.navigationController pushViewController:vc animated:true];
    }
}
#pragma mark - 手环功能

- (void)onDeleteDevice {
    __weak XYSeetingController *wself = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定删除设备?" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LSEDevice *device = [LSEDevice alloc];
        device.deviceInfo = [[LSScanDeviceInfo alloc] init];
        device.deviceInfo.macAddress = _device.macAddress;
        [[LSDeviceManager shared] removeDevice:_device.deviceId block:^(LSDevice *device, LSRemoveDeviceCallBackCode code) {
            SGLog(@"删除设备 code = %ld", code);
            [wself.navigationController popViewControllerAnimated:true];
        }];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:sureAction];
    [alert addAction:cancleAction];
    [self presentViewController:alert animated:true completion:nil];
}

@end
