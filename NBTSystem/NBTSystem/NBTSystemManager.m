//
//  NBTSystemManager.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "NBTSystemManager.h"

@implementation NBTSystemManager

+ (NBTSystemManager *)sharedInstance {
    static NBTSystemManager *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[NBTSystemManager alloc] init];
    });
    
    return _sharedInstance;
}

@end
