//
//  BNRViewController.m
//  Quiz
//
//  Created by daipeng on 15-2-28.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRViewController.h"

@interface BNRViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@end

@implementation BNRViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // 调用父类init方法
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self)
    {
        // 创建两个数组对象，存储所需要的问题和答案
        // 同时，将questions/answers分别指向问题数组和答案数组
        self.questions = @[@"From what is cognac made?",
                           @"what is 7+7?",
                           @"what is the capital of Vermont?"];

        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // 进入下一个问题
    self.currentQuestionIndex++;

    // 是否已经回答完问题
    if(self.currentQuestionIndex == [self.questions count]){
        //回到第一个问题
        self.currentQuestionIndex = 0;
    }
    // 根据正在回答的问题取出问题字符串
    NSString *question = self.questions[self.currentQuestionIndex];

    // 将问题现实在标签上
    self.questionLabel.text = question;

    // 重置答案字符串
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    // 当前问题的答案是什么
    NSString *answer = self.answers[self.currentQuestionIndex];

    // 在答案标签上显示相应的答案
    self.answerLabel.text = answer;
}

@end
