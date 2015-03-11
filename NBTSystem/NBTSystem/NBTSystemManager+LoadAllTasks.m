//
//  NBTSystemManager+LoadAllTasks.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "NBTSystemManager+LoadAllTasks.h"
#import "Task.h"

@implementation NBTSystemManager (LoadAllTasks)

- (void)allTasks {
    PFQuery *query = [PFQuery queryWithClassName:@"Task"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
            NSMutableArray* tasksArr = [[NSMutableArray alloc] init];
            
            for (NSInteger i = 0; i < objects.count; i++) {
                PFObject *objectTask = [objects objectAtIndex:i];
                Task *task = [[Task alloc] init];
                task.ID = objectTask.objectId;
                task.initiatorID = [objectTask objectForKey:@"userInitiator"];
                task.implementatorID = [objectTask objectForKey:@"userImplementator"];
                task.title = [objectTask objectForKey:@"titleTask"];
                task.descriptionTask = [objectTask objectForKey:@"description"];
                task.stateTask = [objectTask objectForKey:@"stateTask"];
                task.createdAt = objectTask.createdAt;
                task.updatedAt = objectTask.updatedAt;
                
                [tasksArr addObject:task];
            }
            id <NBTSystemManagerDelegate> delegateNBTSys = self.delegate;
            if ([delegateNBTSys respondsToSelector:@selector(responceListTasks:andError:)]) {
                [delegateNBTSys responceListTasks:tasksArr andError:error];
            }
            NSLog(@"%@", tasksArr);
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
