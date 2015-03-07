//
//  BNRItem.h
//  RandomItems
//
//  Created by daipeng on 15-3-2.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;

- (NSDate *)dateCreated;

- (instancetype)initWithItemName:(NSString *)itemName
                   valueInDllars:(int)value
                    serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)itemName
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

+ (instancetype)randomItem;


@end
