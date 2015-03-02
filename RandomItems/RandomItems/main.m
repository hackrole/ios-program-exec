//
//  main.m
//  RandomItems
//
//  Created by daipeng on 15-3-2.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 创建一个NSMutableArrary对象
        NSMutableArray *items = [[NSMutableArray alloc] init];

        // 发送atItems消息
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];

        // 继续发送消息
        [items insertObject:@"Zero" atIndex:0];

        // 简单遍历
        for (int i = 0; i < [items count]; i++) {
            NSString *item = [items objectAtIndex:i];
            NSLog(@"%@", item);
        }

        // 快速枚举遍历
        for (NSString *item in items){
            NSLog(@"%@", item);
        }


        // 释放array对象
        items = nil;
        
    }
    return 0;
}

