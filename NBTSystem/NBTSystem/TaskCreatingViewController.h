//
//  TaskCreatingViewController.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBTSystemManager.h"
#import "NBTSystemManager+CreateTask.h"
#import "NBTSystemManager+LoadAllUsers.h"
#import "UsersTableViewController.h"
#import "Task.h"

@interface TaskCreatingViewController : UIViewController <UserTableDelegate, UITextFieldDelegate, NBTSystemManagerDelegate>

@end
