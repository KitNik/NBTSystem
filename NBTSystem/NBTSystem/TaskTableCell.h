//
//  TaskTableCell.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameTask;
@property (weak, nonatomic) IBOutlet UILabel *stateTask;

@end
