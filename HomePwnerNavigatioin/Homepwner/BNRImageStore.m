//
//  BNRImageStore.m
//  Homepwner
//
//  Created by daipeng on 15-3-8.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+ (instancetype)sharedStore{
    static BNRImageStore *sharedStore = nil;

    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }

    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRImageStore sharedStore]"
                                 userInfo:nil];
}

- (instancetype)initPrivate
{
    self = [super init];

    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }

    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    //[self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    //return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImgeForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
