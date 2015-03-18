//
//  BNRItem.h
//  RandomItems
//
//  Created by daipeng on 15-3-2.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;

- (instancetype)initWithItemName:(NSString *)itemName
                   valueInDllars:(int)value
                    serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)itemName
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

+ (instancetype)randomItem;

@end
