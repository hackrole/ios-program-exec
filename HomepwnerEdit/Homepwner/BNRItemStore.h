//
//  BNRItemStore.h
//  Homepwner
//
//  Created by daipeng on 15-3-5.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;

- (BNRItem *)createItem;

- (void)removeItem:(BNRItem *)item;

- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;
@end
