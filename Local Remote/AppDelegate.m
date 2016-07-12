//
//  AppDelegate.m
//  Local Remote
//
//  Created by 陈天宇 on 16/7/12.
//  Copyright © 2016年 jone.Chan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        
        UIMutableUserNotificationCategory *catergory = [[UIMutableUserNotificationCategory alloc] init];
        catergory.identifier = @"Test";
        
        UIMutableUserNotificationAction *foreGroundAction = [[UIMutableUserNotificationAction alloc] init];
        foreGroundAction.identifier = @"foreGround";
        foreGroundAction.title = @"前台";
        foreGroundAction.activationMode =UIUserNotificationActivationModeForeground;
        
        UIMutableUserNotificationAction *backGroundAction = [[UIMutableUserNotificationAction alloc] init];
        backGroundAction.identifier = @"backGround";
        backGroundAction.title = @"后台";
        backGroundAction.activationMode = UIUserNotificationActivationModeBackground;
        
        [catergory setActions:@[foreGroundAction,backGroundAction] forContext:UIUserNotificationActionContextDefault];
        
        NSSet *categories = [NSSet setWithObject:catergory];
        
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:categories];
        [application registerUserNotificationSettings:setting];
    }
    
    UILocalNotification *localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification) {
        // 跳转界面
        
        UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
        tabBarVC.selectedIndex = [localNotification.userInfo[@"pageNumber"] integerValue];
    }
    
    return YES;
}


- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    
    NSLog(@"identifier:%@",identifier);
    
    
    completionHandler();
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    // APP处于活跃状态不跳转界面
    
    if (application.applicationState == UIApplicationStateActive) {
        return;
    }
    
    // 跳转界面
    
    UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
    tabBarVC.selectedIndex = [notification.userInfo[@"pageNumber"] integerValue];
}

@end
