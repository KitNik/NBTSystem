//
//  TasksTableViewController.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TasksTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray *listObjects;

@end
