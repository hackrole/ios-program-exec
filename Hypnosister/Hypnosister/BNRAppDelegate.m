//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by daipeng on 15-3-3.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // 创建两个CGRect对象
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;

    // 创建一个UIScrollView对象, 将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];

    [self.window addSubview:scrollView];

    // 创建一个BNRHypnosisView对象
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [scrollView addSubview:hypnosisView];

    // 创建第二个BNRHypnosisView对象
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:anotherView];

    //告诉UIScrollView对象范围
    scrollView.contentSize = bigRect.size;

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
