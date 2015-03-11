//
//  NBTSystemManager+CreateTask.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "NBTSystemManager+CreateTask.h"

@implementation NBTSystemManager (CreateTask)

- (void)addTask:(Task *)newTask {
    PFObject *task = [PFObject objectWithClassName:@"Task"];
    task[@"userInitiator"] = newTask.initiatorID;
    task[@"userImplementer"] = newTask.implementatorID;
    task[@"stateTask"] = newTask.stateTask;
    task[@"titleTask"] = newTask.title;
    task[@"description"] = newTask.descriptionTask;
    
    [task saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"New Task was success added");
        } else {
            NSLog(@"%@", [[error userInfo] objectForKey:@"error"]);
        }
    }];
}

@end
