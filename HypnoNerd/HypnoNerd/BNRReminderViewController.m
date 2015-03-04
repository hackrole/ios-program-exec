//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by daipeng on 15-3-4.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Settings a reminder for %@", date);

    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;

    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    [notifications addObject:note];

    UIApplication *app = [UIApplication sharedApplication];

    app.scheduledLocalNotifications = notifications;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // 获取tabBarItem所指向的对象
        UITabBarItem *tbi = self.tabBarItem;

        // 设置标题
        tbi.title = @"Reminder";

        // 设置图片
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"bnr reminder load");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}
@end
