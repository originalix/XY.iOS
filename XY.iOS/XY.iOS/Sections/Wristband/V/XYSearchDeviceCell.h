//
//  XYSearchDeviceCell.h
//  XY.iOS
//
//  Created by Lix on 2017/10/9.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSEDevice.h"

@interface XYSearchDeviceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *macAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *RSSILabel;


- (void)setContent:(LSEDevice *)device;

@end
