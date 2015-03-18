//
//  BNRImageStore.h
//  Homepwner
//
//  Created by daipeng on 15-3-8.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRImageStore : NSObject

+ (instancetype)sharedStore;
- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
