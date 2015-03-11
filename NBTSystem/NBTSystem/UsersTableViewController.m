//
//  TableViewController.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "UsersTableViewController.h"
#import "Task.h"
#import "UserTableCell.h"
#import "TaskTableCell.h"

#define USER 0
#define TASK 1

@interface UsersTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *userListTable;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.userListTable.delegate = self;
    self.userListTable.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UserCell";

    UserTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UserTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    User *tempUser = [self.listObjects objectAtIndex:indexPath.row];
    
    cell.userName.text = [NSString stringWithFormat:@"%@ %@", tempUser.firstName, tempUser.lastName];
    cell.userRole.text = tempUser.roleType;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.listObjects objectAtIndex:indexPath.row] != nil) {
        if (self.initiatorUser) {
            if ([self.delegate respondsToSelector:@selector(setUserInitiator:)]) {
                User *userInitiator = [self.listObjects objectAtIndex:indexPath.row];
                [self.delegate setUserInitiator:userInitiator];
            }
        } else if (self.implementerUser) {
            if ([self.delegate respondsToSelector:@selector(setUserImplementer:)]) {
                User *userImplementer = [self.listObjects objectAtIndex:indexPath.row];
                [self.delegate setUserImplementer:userImplementer];
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
