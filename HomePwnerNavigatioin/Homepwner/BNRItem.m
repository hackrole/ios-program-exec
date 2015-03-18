//
//  BNRItem.m
//  RandomItems
//
//  Created by daipeng on 15-3-2.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    // 创建不可变数组对象
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rustry", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];

    // 随机索引
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];

    NSString *randName = [NSString stringWithFormat:@"%@ %@",
                          [randomAdjectiveList objectAtIndex:adjectiveIndex],
                          [randomNounList objectAtIndex:nounIndex]];

    int randomValue = arc4random() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26];

    BNRItem *newItem = [[self alloc] initWithItemName:randName
                                        valueInDllars:randomValue
                                         serialNumber:randomSerialNumber];


    return newItem;

}

- (instancetype)initWithItemName:(NSString *)itemName
                   valueInDllars:(int)value
                    serialNumber:(NSString *)sNumber
{
    // 调用父类初始化方法
    self = [super init];

    if(self){
        _itemName = itemName;
        _serialNumber = sNumber;
        _valueInDollars = value;

        // 设置系统当前时间
        _dateCreated = [[NSDate alloc] init];
    }

    // iamge uuid
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    _itemKey = key;

    // 返回对象
    return self;

}

- (instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDllars:0 serialNumber:@""];
}

- (instancetype)initWithItemName:(NSString *)itemName
                    serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:itemName
                    valueInDllars:100
                     serialNumber:sNumber];
}

- (instancetype)init
{
    return [self initWithItemName:@"Item"];
}


- (NSString *)description
{
    NSString *describe = [[NSString alloc] initWithFormat:@"%@ (%@): worth $%d, recorded on %@",
                          self.itemName, self.serialNumber,
                          self.valueInDollars, self.dateCreated];

    return describe;
}

- (void)setContainedItem:(BNRItem *)containedItem
{
    _containedItem = containedItem;
    self.containedItem.container = self;
}

@end
