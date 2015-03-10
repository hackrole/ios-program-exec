//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by daipeng on 15-3-10.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
