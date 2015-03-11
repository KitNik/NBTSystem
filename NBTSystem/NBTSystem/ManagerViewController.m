//
//  ManagerViewController.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "ManagerViewController.h"
//#import "UsersTableViewController.h"
//#import "TasksTableViewController.h"
#import "TaskCreatingViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[NBTSystemManager sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)createNewTask:(id)sender {
    UIStoryboard *storyBoard = self.storyboard;
    TaskCreatingViewController *taskCreatingViewController = [storyBoard instantiateViewControllerWithIdentifier:@"TaskCreatingViewController"];
    [self.navigationController pushViewController:taskCreatingViewController animated:YES];
}
//
//#pragma mark - NBTSystemDelegate
//
//- (void)responceListTasks:(NSArray *)listTasks andError:(NSError *)error {
//    UIStoryboard *storyBoard = self.storyboard;
//    TasksTableViewController *taskTableViewController = [storyBoard instantiateViewControllerWithIdentifier:@"TasksTableViewController"];
//    taskTableViewController.listObjects = listTasks;
//    [self.navigationController pushViewController:taskTableViewController animated:YES];
//}
//
//- (void)responceListUsers:(NSArray *)listUsers andError:(NSError *)error {
//    UIStoryboard *storyBoard = self.storyboard;
//    UsersTableViewController *tableViewController = [storyBoard instantiateViewControllerWithIdentifier:@"UsersTableViewController"];
//    tableViewController.listObjects = listUsers;
//    [self.navigationController pushViewController:tableViewController animated:YES];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
