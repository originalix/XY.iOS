//
//  XYSearchDeviceCell.m
//  XY.iOS
//
//  Created by Lix on 2017/10/9.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSearchDeviceCell.h"

@interface XYSearchDeviceCell()

@end

@implementation XYSearchDeviceCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setContent:(LSEDevice *)device {
    [self.nameLabel setText:device.deviceInfo.name];
    [self.macAddressLabel setText:device.deviceInfo.macAddress];
    [self.RSSILabel setText:[NSString stringWithFormat:@"%li", device.deviceInfo.rssi]];
}

@end
