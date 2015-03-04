//
//  BNRHyponsisViewController.m
//  HypnoNerd
//
//  Created by daipeng on 15-3-4.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRHyponsisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHyponsisViewController

- (void)loadView
{
    // 创建一个BNRHypnosisView
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];

    // 设置viewController view属性
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {

        // 设置标签页标题
        self.tabBarItem.title = @"Hypnotize";

        // 从图像文件创建一个UIImage对象
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];

        // 设置图片
        self.tabBarItem.image = i;
    }

    return self;
}
- (void) viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"bnr hypnosis did load");
}

@end
