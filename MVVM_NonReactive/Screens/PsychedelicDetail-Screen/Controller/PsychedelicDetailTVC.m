//
//  PsychedelicDetailTVC.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "PsychedelicDetailTVC.h"

#import "Router.h"


@interface PsychedelicDetailTVC ()

@end

@implementation PsychedelicDetailTVC

#pragma mark - Inits methods

- (instancetype)initWithVM:(ViewModel_ListOfPsychedelicWorkers_TableView*) vm
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"PsychedelicDetailTVC"];
    
    if (self) {
        self.title = @"Apple`s Engineers";
        self.vmListOfPsychedelicWorkers_TableView = vm;
    }
    return self;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.vmListOfPsychedelicWorkers_TableView countWorkers];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewModel_BasedWorker_Cell* vm  = [self.vmListOfPsychedelicWorkers_TableView cellViewModel:indexPath.row];
    
    if ([vm isKindOfClass: [ViewModel_WorkerLeftAlignment_Cell class]]){
        WorkerLeftAlignment_Cell* cell = (WorkerLeftAlignment_Cell*)[tableView dequeueReusableCellWithIdentifier:@"WorkerLeftAlignment_Cell"];
        cell.vmWorkerCell = (ViewModel_WorkerLeftAlignment_Cell*)vm;
        return cell;
    }
    
    if ([vm isKindOfClass: [ViewModel_WorkerRightAlignment_Cell class]]) {
        WorkerRightAlignment_Cell* cell = (WorkerRightAlignment_Cell*)[tableView dequeueReusableCellWithIdentifier:@"WorkerRightAlignment_Cell"];
        cell.vmWorkerCell = (ViewModel_WorkerRightAlignment_Cell*)vm;
        return cell;
    }
    
    if ([vm isKindOfClass: [ViewModel_WorkerBigName_Cell class]]) {
       WorkerBigName_Cell* cell = (WorkerBigName_Cell*)[tableView dequeueReusableCellWithIdentifier:@"WorkerBigName_Cell"];
        cell.vmWorkerCell = (ViewModel_WorkerBigName_Cell*)vm;
        return cell;
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // Pass data to ViewModel for Routing
    [self.vmListOfPsychedelicWorkers_TableView didSelectAtRowFromTable:indexPath];
}


#pragma mark - Others


- (void) setVmListOfPsychedelicWorkers_TableView:(ViewModel_ListOfPsychedelicWorkers_TableView *)vmListOfPsychedelicWorkers_TableView {
    
      _vmListOfPsychedelicWorkers_TableView = vmListOfPsychedelicWorkers_TableView;
     [_vmListOfPsychedelicWorkers_TableView generateVMforCells:^(BOOL successOperation) {
         [self.tableView reloadData];

     } onFailure:^(NSError *errorBlock) {
         NSLog(@"setControllerVM = %@",errorBlock);
     }];
}

@end
