//
//  ViewController.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "RootViewController.h"
#import "NBTSystemManager+LogIn.h"
#import "AdminViewController.h"
#import "ManagerViewController.h"
#import "WorkerViewController.h"

#define ADMIN @"admin"
#define MANAGER @"manager"

#define USER_TYPE_ADMIN @"admin"
#define USER_TYPE_MANAGER @"manager"
#define USER_TYPE_WORKER @"worker"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *logInField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation RootViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NBTSystemManager sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)login:(id)sender {
    [[NBTSystemManager sharedInstance] logInUser:self.logInField.text andPassword:self.passwordField.text];
}

#pragma mark - NBTSystemDelegate

- (void)responseUserLogIn:(User *)localUser andError:(NSError *)error {
    UIStoryboard *storyBoard = self.storyboard;
    if ([localUser.roleType  isEqual: USER_TYPE_ADMIN]) {
        AdminViewController *adminViewController = [storyBoard instantiateViewControllerWithIdentifier:@"AdminViewController"];
        [self.navigationController pushViewController:adminViewController animated:YES];
    } else if ([localUser.roleType  isEqual: USER_TYPE_MANAGER]) {
        ManagerViewController *managerViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ManagerViewController"];
        [self.navigationController pushViewController:managerViewController animated:YES];
    } else if ([localUser.roleType  isEqual: USER_TYPE_WORKER]) {
        WorkerViewController *workerViewController = [storyBoard instantiateViewControllerWithIdentifier:@"WorkerViewController"];
        [self.navigationController pushViewController:workerViewController animated:YES];
    }
}

#pragma mark - UitextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
