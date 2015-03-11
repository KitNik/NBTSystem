//
//  NBTSystemManager+LoadAllUsers.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "NBTSystemManager+LoadAllUsers.h"

@implementation NBTSystemManager (LoadAllUsers)

- (void)allUsers {
    PFQuery *query = [PFQuery queryWithClassName:@"_User"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
            NSMutableArray *userArr = [[NSMutableArray alloc] init];
            for (NSInteger i = 0; i < objects.count; i++) {
                PFUser *user = [objects objectAtIndex:i];
                User *localUser = [[User alloc] init];
                localUser.roleType = [user objectForKey:@"roleType"];
                localUser.ID = user.objectId;
                localUser.name = user.username;
                localUser.eMail = user.email;
                localUser.firstName = [user objectForKey:@"firstName"];
                localUser.lastName = [user objectForKey:@"lastName"];
                localUser.tasks = [[NSMutableArray alloc] initWithArray:[user objectForKey:@"Task"]];
                localUser.journal = [[NSMutableArray alloc] initWithArray:[user objectForKey:@"Journal"]];
                localUser.createdAt = user.createdAt;
                localUser.updatedAt = user.updatedAt;
                localUser.eMailVerfied = [user objectForKey:@"emailVerified"];
                [userArr addObject:localUser];
            }
            NSLog(@"%@", userArr);
            id <NBTSystemManagerDelegate> delegateNBTSys = self.delegate;
            if ([delegateNBTSys respondsToSelector:@selector(responceListUsers:andError:)]) {
                [delegateNBTSys responceListUsers:userArr andError:error];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
