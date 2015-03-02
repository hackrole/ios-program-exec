//
//  main.m
//  RandomItems
//
//  Created by daipeng on 15-3-2.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

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

        BNRItem *item = [[BNRItem alloc] init];

        // 设置itemName, serialNumber, valueInDollars
        [item setSerialNumber:@"Red Sofa"];
        [item setSerialNumber:@"A1B2C"];
        [item setValueInDollars:100];

        // 使用.语法设置属性
        item.itemName = @"Red Sofa 2";
        item.serialNumber = @"A1B2C 2";
        item.valueInDollars = 100;

        NSLog(@"%@ %@ %@ %d", [item itemName], [item dateCreated],
              [item serialNumber], [item valueInDollars]);
        // 使用.语法打印
        NSLog(@"%@ %@ %@ %d", item.itemName, item.dateCreated,
              item.serialNumber, item.valueInDollars);

        // 使用description方法
        NSLog(@"%@", item);

        // 使用初始化方法
        BNRItem *itemInit = [[BNRItem alloc] initWithItemName:@"Red Line"
                                                valueInDllars:102
                                                 serialNumber:@"ABCD"];
        NSLog(@"%@", itemInit);

        BNRItem *itemWithName = [[BNRItem alloc] initWithItemName:@"Blue line"];
        NSLog(@"%@", itemWithName);

        BNRItem *itemNoName = [[BNRItem alloc] init];
        NSLog(@"%@", itemNoName);

        // 测试BNRItem
        for (int i = 0; i< 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }

        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }

        // 尝试抛出异常
        //id lastObj = [items lastObject];
        // [lastObj count];

        // 释放array对象
        items = nil;


        
    }
    return 0;
}

