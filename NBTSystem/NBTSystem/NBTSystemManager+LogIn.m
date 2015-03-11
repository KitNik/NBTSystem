//
//  NBTSystemManager+LogIn.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "NBTSystemManager+LogIn.h"

@implementation NBTSystemManager (LogIn)

- (void)logInUser:(NSString *)logIn andPassword:(NSString *)password {
    [PFUser logInWithUsernameInBackground:logIn password:password block:^(PFUser *user, NSError *error) {
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
        if (!error) {
            NSLog(@"%@", user);
            
            id <NBTSystemManagerDelegate> delegateNBTSys = self.delegate;
            if ([delegateNBTSys respondsToSelector:@selector(responseUserLogIn:andError:)]) {
                [delegateNBTSys responseUserLogIn:localUser andError:error];
            }
            
        } else {
            NSLog(@"%@", error);
        }
    }];
}

@end
