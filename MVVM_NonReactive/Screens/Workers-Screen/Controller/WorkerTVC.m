//
//  WorkerTVC.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerTVC.h"

#import "Router.h"

@interface WorkerTVC ()


@end

@implementation WorkerTVC

#pragma mark - Inits methods

- (instancetype)init
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"WorkerTVC"];
    
    if (self) {
        self.title = @"Apple`s Engineers";
        
        UIImage *logOutIcon   = [[UIImage imageNamed:@"logout"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        if (self.navigationItem){

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:logOutIcon
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(logoutAction)];
        }
    }
    return self;
}


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.vmListOfWorkers_TableView countWorkers];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewModel_Worker_Cell* vm  = [self.vmListOfWorkers_TableView cellViewModel:indexPath.row];
    
    if ([vm isKindOfClass: [ViewModel_Worker_Cell class]]){
        WorkerCell* cell  = (WorkerCell*)[tableView dequeueReusableCellWithIdentifier:@"WorkerCell"];
        cell.vmWorkerCell = (ViewModel_Worker_Cell*)vm;
        return cell;
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // 1. Call to VM
    [self.vmListOfWorkers_TableView didSelectAtRowFromTable:indexPath];
}

#pragma mark - Actions

- (void)logoutAction {
    // Call to ViewModel
    [self.vmListOfWorkers_TableView logoutBtnClicked];
}

#pragma mark - Others

// Setters
- (void) setVmListOfWorkers_TableView:(ViewModel_ListOfWorkers_TableView *)vmListOfWorkers_TableView
{
     _vmListOfWorkers_TableView = vmListOfWorkers_TableView;
    [_vmListOfWorkers_TableView updateWorkerList:^(BOOL successOperation) {
        [self.tableView reloadData];

    } onFailure:^(NSError *errorBlock, NSObject *errObj) {
        NSLog(@"setControllerVM = %@",errorBlock);
    }];
}

@end
