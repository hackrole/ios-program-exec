//
//  BNRHyponsisViewController.m
//  HypnoNerd
//
//  Created by daipeng on 15-3-4.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRHyponsisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHyponsisViewController () <UITextFieldDelegate>

@end

@implementation BNRHyponsisViewController

- (void)loadView
{
    // 创建一个BNRHypnosisView
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];

    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

    // 设置textField样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;

    // 设置委托
    textField.delegate = self;

    [backgroundView addSubview:textField];

    // 设置viewController view属性
    self.view = backgroundView;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];

        // 设置UILabel对象文字和颜色
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;

        // 根据需要显示文字调整UILabel对象大小
        [messageLabel sizeToFit];

        // 获取随机坐标
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;

        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;

        // 设置UIlabel对象Frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;

        // 添加到view
        [self.view addSubview:messageLabel];

        // 视差效果
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.x"
                        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);

        [messageLabel addMotionEffect:motionEffect];

        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.y"
                        type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);

        [messageLabel addMotionEffect:motionEffect];

    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField);

    [self drawHypnoticMessage:textField.text];

    textField.text = @"";
    [textField resignFirstResponder];

    return YES;
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
