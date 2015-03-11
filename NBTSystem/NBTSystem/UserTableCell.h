//
//  UserTableCell.h
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userRole;

@end
