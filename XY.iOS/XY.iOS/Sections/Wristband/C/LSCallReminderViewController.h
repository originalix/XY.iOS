//
//  LSCallReminderViewController.h
//  XY.iOS
//
//  Created by Lix on 2017/10/11.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSCallReminderViewController : UIViewController

@property (nonatomic, strong) LSDevice *device;

@property (nonatomic, assign) LSReminderType type;

@end
