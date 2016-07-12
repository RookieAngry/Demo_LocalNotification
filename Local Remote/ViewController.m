//
//  ViewController.m
//  Local Remote
//
//  Created by 陈天宇 on 16/7/12.
//  Copyright © 2016年 jone.Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)jumpToPurple {
    [self localNotificationWithAlertBody:@"jumpToPurple" userInfo:@{@"pageNumber" : @(1)}];
    
}

- (IBAction)jumpToOrange {
    [self localNotificationWithAlertBody:@"jumpToOrange" userInfo:@{@"pageNumber" : @(2)}];
}


- (void)localNotificationWithAlertBody:(NSString *)alertBody userInfo:(NSDictionary *)userInfo {
    UILocalNotification *localNoti = [[UILocalNotification alloc] init];
    
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNoti.alertBody = alertBody;
    localNoti.userInfo = userInfo;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNoti];
}

- (void)localNotificationBasicUse {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    localNotification.alertBody = @"这是一个本地通知测试";
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    localNotification.applicationIconBadgeNumber = 99;
    
    localNotification.alertLaunchImage = @"UILaunchImageFile";
    
    localNotification.category = @"Test";
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
