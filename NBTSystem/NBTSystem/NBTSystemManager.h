//
//  NBTSystemManager.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "User.h"
#import "Task.h"

@protocol NBTSystemManagerDelegate <NSObject>

@optional
- (void)responseUserLogIn:(User *)localUser andError:(NSError *)error;
- (void)responceListTasks:(NSArray *)listTasks andError:(NSError *)error;
- (void)responceListUsers:(NSArray *)listUsers andError:(NSError *)error;

@end

@interface NBTSystemManager : NSObject

+ (NBTSystemManager *)sharedInstance;

@property (nonatomic, strong)id <NBTSystemManagerDelegate> delegate;

@end
