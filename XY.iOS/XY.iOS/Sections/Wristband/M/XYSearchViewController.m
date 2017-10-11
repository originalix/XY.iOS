//
//  XYSearchViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSearchViewController.h"
#import "XYDeviceManager.h"
#import "XYSearchDeviceCell.h"
#import "LSEDevice.h"
#import "XYSeetingController.h"
#import "NSString+LSStrReverseOrder.h"

@interface XYSearchViewController ()<LSScanDeviceDelegate, UITableViewDataSource, UITableViewDelegate, LSBindDeviceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *searchList;
@property (nonatomic, assign) NSInteger filterRSSI;
@property (nonatomic, copy) NSString *filterName;

@property (nonatomic, strong) NSString *pairNum;
@property (nonatomic, strong) NSString *userNum;
@property (nonatomic, strong) NSString *deviceIdToRegister;

@property (nonatomic, strong) LSEDevice *targetDevice;

@end

@implementation XYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutItem];
    self.searchList = [NSMutableArray array];
    self.filterRSSI = -100;
    self.filterName = @"";
    [self.tableView registerNib:[UINib nibWithNibName:@"XYSearchDeviceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onDeviceDetailInfo:)
                                                 name:DEVICE_DETAILINFO_KEY
                                               object:nil];
    
    [self startSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[LSDeviceManager shared] stopScan];
}

- (void)layoutItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(goToSettingController)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)startSearch {
    [[LSDeviceManager shared] stopScan];
    [self.searchList removeAllObjects];
    [self.tableView reloadData];
    [[LSDeviceManager shared] scanDevice:self];
}

- (void)stopSearch {
    [[LSDeviceManager shared] stopScan];
}

#pragma mark - LSScanDeviceDelegate
- (void)onScanResult:(LSScanDeviceInfo *)deviceInfo {
    if (deviceInfo.rssi == 127) {
        return;
    }
    
    if (self.filterRSSI == 0 && self.filterName.length == 0) {
        [self addDeviceToList:deviceInfo];
        
    } else if (self.filterRSSI == 0 && self.filterName.length > 0) {
        if ([deviceInfo.name isEqualToString:self.filterName]) {
            [self addDeviceToList:deviceInfo];
        }
        
    } else if (self.filterRSSI != 0 && self.filterName.length == 0) {
        if (deviceInfo.rssi >= self.filterRSSI) {
            [self addDeviceToList:deviceInfo];
        }
        
    } else if (self.filterRSSI != 0 && self.filterName.length > 0) {
        if (deviceInfo.rssi >= self.filterRSSI && [deviceInfo.name isEqualToString:self.filterName]) {
            [self addDeviceToList:deviceInfo];
        }
    }
}

- (void)addDeviceToList:(LSScanDeviceInfo *)deviceInfo {
    for (LSEDevice *item in self.searchList) {
        if ([item.deviceInfo.macAddress isEqualToString:deviceInfo.macAddress]) {
            item.deviceInfo.rssi = deviceInfo.rssi;
            return;
        }
    }
    
    LSEDevice *device = [[LSEDevice alloc] init];
    device.deviceInfo = deviceInfo;
    device.connectState = LSEDeviceStateDisConnect;
    [self.searchList addObject:device];
    
    NSArray *result = [self.searchList sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id  _Nonnull obj2) {
        LSEDevice *item1 = (LSEDevice *)obj1;
        LSEDevice *item2 = (LSEDevice *)obj2;
        return item1.deviceInfo.rssi < item2.deviceInfo.rssi;
    }];
    self.searchList = [NSMutableArray arrayWithArray:result];
    
    NSArray *position = @[[NSIndexPath indexPathForRow:[self.searchList indexOfObject:device] inSection:0]];
    [self.tableView insertRowsAtIndexPaths:position withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYSearchDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LSEDevice *device = [self.searchList objectAtIndex:indexPath.row];
    [cell setContent:device];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定添加设备?" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LSEDevice *device = [self.searchList objectAtIndex:indexPath.row];
        [[LSDeviceManager shared] bindDevice:device.deviceInfo.macAddress delegate:self];
//        [self disConnectDevice:device];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:sureAction];
    [alert addAction:cancleAction];
    [self presentViewController:alert animated:true completion:nil];
}

// Bind delegate
- (void)onBindDeviceFailed:(NSString *)macAddr code:(LSBindDeviceFailedCode)code {
    NSString *detail = @"";
    if (code == LSBindDeviceFailedCodeBLENotAvailable) {
        detail = @"绑定失败,蓝牙未开启";
    } else if (code == LSBindDeviceFailedCodeSDKNotAvailable) {
        detail = @"绑定失败,SDK未初始化完成或未启动";
    } else if (code == LSBindDeviceFailedCodeDisconnect) {
        detail = @"绑定失败, 设备断开连接";
    }
    SGLog(@"detail = %@, code = %ld", detail, code);
}

- (void)onBindDeviceSuccess:(NSString *)macAddr device:(LSDevice *)device {
    SGLog(@"开始添加设备...");
    
    for (LSEDevice *item in self.searchList) {
        if ([item.deviceInfo.macAddress isEqualToString:device.macAddress]) {
            if (!item.detailInfo)
            {
                item.detailInfo = [LSDeviceInfo new];
            }
            item.detailInfo.deviceId = device.deviceId;
            
//            [self addDeviceToDB:item];
            if (item.connectState == LSEDeviceStateDisConnect) {
                [self connectDevice:item];
                self.targetDevice = item;
            }
            return;
        }
    }
}

- (void)connectDevice:(LSEDevice *)device {
    device.connectState = LSEDeviceStateConnecting;
//    [self saveDeviceToDB:device callback:nil];
    
    LSDevice *v_device = [[LSDevice alloc] init];
    v_device.macAddress = device.deviceInfo.macAddress;
    v_device.deviceId = device.detailInfo.deviceId;
    
    __block LSEDevice *blockDevice = device;
    
    [[LSDeviceManager shared] addDevice:v_device userInfo:[LSDeviceUserInfo new] block:^(LSDevice *lsdevice, LSAddDeviceCallBackCode code) {
        SGLog(@"连接设备 code: %ld ", code);
        [self stopSearch];
    }];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:DEVICE_CONNECT_STATE_CHANGE_KEY object:device];
    });
}

- (void)disConnectDevice:(LSEDevice *)device
{
    device.connectState = LSEDeviceStateDisConnect;
//    [self saveDeviceToDB:device callback:nil];
    
    LSDevice *v_device = [[LSDevice alloc] init];
    v_device.macAddress = device.deviceInfo.macAddress;
    v_device.deviceId = device.detailInfo.deviceId;
    [[LSDeviceManager shared] removeDevice:v_device.deviceId block:^(LSDevice *device, LSRemoveDeviceCallBackCode code) {
        SGLog(@"删除设备 code: %ld ", code);
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:DEVICE_CONNECT_STATE_CHANGE_KEY object:device];
    });
}

- (void)onBindDeviceProcess:(NSString *)macAddr code:(LSBindDeviceHandlerCode)code handler:(__weak id<LSBindDeviceHandlerDelegate>)handler {
    
    switch (code) {
        case LSBindDeviceHandlerCodeInput:
        {
            NSString *message = @"请输入配对码";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:@"温馨提示" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pairNum:) name:UITextFieldTextDidChangeNotification object:textField];
                textField.tag = 100;
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//                [SVProgressHUD setMinimumDismissTimeInterval:CGFLOAT_MAX];
//                [SVProgressHUD showWithStatus:@"绑定中，请稍后..."];
                SGLog(@"绑定中，请稍后...");
                [handler inputCode:macAddr code:self.pairNum];
                [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
            }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
            break;
        case LSBindDeviceHandlerCodeConfirm:
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否配对" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES completion:nil];
//                [SVProgressHUD setMinimumDismissTimeInterval:CGFLOAT_MAX];
//                [SVProgressHUD showWithStatus:@"绑定中，请稍后..."];
                SGLog(@"绑定中，请稍后...");
                [handler confirm:macAddr isConfirm:YES];
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES completion:nil];
                [handler confirm:macAddr isConfirm:NO];
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
        case LSBindDeviceHandlerCodeInputUserNo:
        {
            NSString *message = @"请输入用户号码绑定";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:@"温馨提示" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
             {
                 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pairNum:) name:UITextFieldTextDidChangeNotification object:textField];
                 textField.secureTextEntry = YES;
                 textField.tag = 101;
             }];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                         {
                                             [handler inputUserNo:macAddr userNo:self.userNum];
                                             [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
                                         }];
            [alertController addAction:sureAction];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
            break;
        case LSBindDeviceHandlerCodeUnregister:
        {
            NSString *message = @"请先注册设备";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:@"温馨提示" preferredStyle:UIAlertControllerStyleAlert];
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
             {
                 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pairNum:) name:UITextFieldTextDidChangeNotification object:textField];
                 textField.secureTextEntry = YES;
                 textField.tag = 102;
             }];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                         {
                                             [handler registerDevice:macAddr deviceId:self.deviceIdToRegister];
                                             [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
                                         }];
            [alertController addAction:sureAction];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alertController animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

- (void)pairNum:(NSNotification *)notify {
    UITextField *textFile = (UITextField *)notify.object;
    if (textFile.tag == 100)
    {
        self.pairNum = textFile.text;
    }
    else if (textFile.tag == 101)
    {
        self.userNum = textFile.text;
    }
    else if (textFile.tag == 102)
    {
        self.deviceIdToRegister = textFile.text;
    }
}


- (void)onDeviceDetailInfo:(NSNotification *)notification {
    LSDeviceInfo *deviceInfo = notification.object;
    NSString *reverseMac = [NSString formatStrWithReverseOrder:deviceInfo.macAddress];
    
    if (!self.targetDevice) {
        return;
    }
    
    if ([self.targetDevice.deviceInfo.macAddress caseInsensitiveCompare:deviceInfo.macAddress] == NSOrderedSame || [self.targetDevice.deviceInfo.macAddress caseInsensitiveCompare:reverseMac] == NSOrderedSame) {
        self.targetDevice.detailInfo = deviceInfo;
        SGLog(@"设置好手环所有的功能");
    }
}

- (void)goToSettingController {
    XYSeetingController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XYSeetingController"];
    vc.device = [[LSDevice alloc] init];
    vc.device.macAddress = self.targetDevice.deviceInfo.macAddress;
    vc.device.deviceId = self.targetDevice.detailInfo.deviceId;
    vc.connectState = self.targetDevice.connectState;
    vc.detailInfo = self.targetDevice.detailInfo;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
