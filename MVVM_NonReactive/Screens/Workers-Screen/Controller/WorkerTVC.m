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

- (instancetype)init
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"WorkerTVC"];
    
    if (self) {
        self.title = @"Apple`s Engineers";
    }
    return self;
}


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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"WorkerCell";
      WorkerCell *cell = (WorkerCell*)[tableView dequeueReusableCellWithIdentifier:identifier];

        if (!cell) {
            cell = (WorkerCell*)[[WorkerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.vmWorkerCell = [self.vmListOfWorkers_TableView cellViewModel: indexPath.row];
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Pass data to ViewModel for Routing
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //[[Router sharedRouter] openDetailTVC_WithIndexPath:indexPath];
    
    // 1. Call to VM
    [self.vmListOfWorkers_TableView didSelectAtRowFromTable:indexPath];
    // 2. VM call to Router
}

#pragma mark - Others

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
