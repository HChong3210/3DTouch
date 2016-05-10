//
//  AppDelegate.m
//  3DTouch
//
//  Created by HChong on 16/4/25.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "AppDelegate.h"
#import "CarRecordVC.h"
#import "DFCNewAssessVC.h"
#import "RootViewController.h"


// ios版本
#define sc_systermVertion  [[UIDevice currentDevice] systemVersion].intValue
@interface AppDelegate ()

@property (nonatomic,strong) RootViewController *rootVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    self.rootVC = [[RootViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:self.rootVC];
    self.window.rootViewController = navc;
    
    //3D Touch
    if (application.shortcutItems.count == 0) {
        [self configShortCutItems];
    }
    UIApplicationShortcutItem *shortItem = launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
    if (shortItem) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self actionShortcutItem:shortItem];//杀进程时调用
        });
        return NO;
    }
    return YES;
}

#pragma mark -3D Touch
//后台时调用
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler {
    if (shortcutItem) {
        [self actionShortcutItem:shortcutItem];
    }
}

-(void)configShortCutItems {
    if (sc_systermVertion >= 9.0f) {
        UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"one" localizedTitle:@"一键发车" localizedSubtitle:nil icon:nil userInfo:nil];
        UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"新建评估" localizedSubtitle:nil icon:nil userInfo:nil];
        [UIApplication sharedApplication].shortcutItems = @[item1, item2];
    }
}

-(void)actionShortcutItem:(UIApplicationShortcutItem *)shortcutItem {
    if ([shortcutItem.type isEqualToString:@"one"]) {
        CarRecordVC *VC= [[CarRecordVC alloc] init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.rootVC.navigationController showViewController:VC sender:nil];
        });
    } else if ([shortcutItem.type isEqualToString:@"two"]) {
        DFCNewAssessVC *VC= [[DFCNewAssessVC alloc] init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.rootVC presentViewController:VC animated:YES completion:^{
            }];
        });
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
