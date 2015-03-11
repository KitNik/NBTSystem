//
//  TaskCreatingViewController.m
//  NBTSystem
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "TaskCreatingViewController.h"
#import "User.h"

@interface TaskCreatingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTaskField;
@property (weak, nonatomic) IBOutlet UITextView *desctiptionTaskText;

@property (weak, nonatomic) IBOutlet UILabel *initiatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *implementerLabel;

@property (nonatomic)User *initiator;
@property (nonatomic)User *implementer;

//@property (nonatomic)UsersTableViewController *usersTableViewController;

@property (nonatomic)BOOL initiatorUser;
@property (nonatomic)BOOL implementerUser;

@end

@implementation TaskCreatingViewController

- (void)viewDidLoad {
    //self.usersTableViewController.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NBTSystemManager sharedInstance].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)createNewTask:(id)sender {
    if (self.initiator && self.implementer) {
        Task *task = [[Task alloc] init];
        task.title = self.titleTaskField.text;
        task.descriptionTask = self.desctiptionTaskText.text;
        task.initiatorID = self.initiator.ID;
        task.implementatorID = self.implementer.ID;
        task.stateTask = @"Not Started";
    
        [[NBTSystemManager sharedInstance] addTask:task];
    }
}

- (IBAction)chooseInitiator:(id)sender {
    self.initiatorUser = YES;
    self.implementerUser = NO;
    [[NBTSystemManager sharedInstance] allUsers];
}

- (IBAction)chooseImplementer:(id)sender {
    self.initiatorUser = NO;
    self.implementerUser = YES;
    [[NBTSystemManager sharedInstance] allUsers];
}


#pragma mark - UsersTableViewControllerDelegate

- (void)setUserInitiator:(User *)initiator {
    if (initiator) {
        self.initiator = initiator;
        self.initiatorLabel.text = [NSString stringWithFormat:@"%@ %@", self.initiator.firstName, self.initiator.lastName];
    }
}

- (void)setUserImplementer:(User *)implementer {
    if (implementer) {
        self.implementer = implementer;
        self.implementerLabel.text = [NSString stringWithFormat:@"%@ %@", self.implementer.firstName, self.implementer.lastName];
    }
}

#pragma mark - NBTSystemDelegate

- (void)responceListUsers:(NSArray *)listUsers andError:(NSError *)error {
    if (listUsers) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UsersTableViewController *usersTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"UsersTableViewController"];
        usersTableViewController.delegate = self;
        usersTableViewController.listObjects = listUsers;
        usersTableViewController.initiatorUser = self.initiatorUser;
        usersTableViewController.implementerUser = self.implementerUser;
        [self.navigationController pushViewController:usersTableViewController animated:YES];
    }
}

#pragma mark - UitextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
