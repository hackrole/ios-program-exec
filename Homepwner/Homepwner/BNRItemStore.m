//
//  BNRItemStore.m
//  Homepwner
//
//  Created by daipeng on 15-3-5.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;

    // 判断是否需要新建
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }

    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (void)removeItem:(BNRItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

// 重写的初始化方法
- (instancetype)initPrivate
{
    self = [super init];

    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    // 移动行
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];

    [self.privateItems addObject:item];

    return item;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

@end
