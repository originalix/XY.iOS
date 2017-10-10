//
//  XYSeetingController.m
//  XY.iOS
//
//  Created by Lix on 2017/10/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSeetingController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)creatData {
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
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
