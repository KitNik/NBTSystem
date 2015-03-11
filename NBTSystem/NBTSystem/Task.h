//
//  Task.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic)NSString *ID;
@property (nonatomic)NSString *initiatorID;
@property (nonatomic)NSString *implementatorID;
@property (nonatomic)NSString *title;
@property (nonatomic)NSString *descriptionTask;
@property (nonatomic)NSString *stateTask;
@property (nonatomic)NSDate* createdAt;
@property (nonatomic)NSDate* updatedAt;

@end
