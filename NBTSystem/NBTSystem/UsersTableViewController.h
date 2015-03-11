//
//  TableViewController.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@protocol UserTableDelegate <NSObject>

@optional
- (void)setUserInitiator:(User *)initiator;
- (void)setUserImplementer:(User *)implementer;

@end

@interface UsersTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)id <UserTableDelegate, NSObject> delegate;

@property (nonatomic, strong)NSArray *listObjects;

@property (nonatomic)BOOL initiatorUser;
@property (nonatomic)BOOL implementerUser;

@end
