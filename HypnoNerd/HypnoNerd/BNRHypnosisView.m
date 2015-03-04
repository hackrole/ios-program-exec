//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by daipeng on 15-3-3.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect bounds = self.bounds;

    // 根据bounds计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    // 比较x, y使用较小的指做半径
    float maxRadius = hypot(bounds.size.width, bounds.size.width) / 2.0;

    // 绘制圆形
    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)]; 
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }


    path.lineWidth = 10;

    //设置绘制颜色
    //[[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];

    [path stroke];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);

    //获取3个0-1之间的值
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100 ) / 100.0;
    float blue = (arc4random() % 100) / 100.0;

    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];

    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    // 设置属性后重绘	
    _circleColor = circleColor;
    NSLog(@"%@", circleColor);
    [self setNeedsDisplay];
}

@end
