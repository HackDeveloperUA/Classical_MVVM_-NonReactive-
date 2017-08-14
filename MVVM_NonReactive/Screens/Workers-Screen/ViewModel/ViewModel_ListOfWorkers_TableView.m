//
//  WorkerViewModel.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_ListOfWorkers_TableView.h"

#import "ServerManager.h"

@implementation ViewModel_ListOfWorkers_TableView


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellsArray = [NSMutableArray array];
    }
    return self;
}


- (void) updateWorkerList:(void(^)(BOOL successOperation)) success
                onFailure:(void(^)(NSError* errorBlock,  NSObject* errObj)) failure
{
    
    [self.cellsArray removeAllObjects];
    
    [[ServerManager sharedManager] getListAllWorkers:^(NSArray *arrayWorkers) {
        self.modelArray = [NSMutableArray arrayWithArray:arrayWorkers];
        
        for (WorkerShort* worker in arrayWorkers) {
            [self.cellsArray addObject: [[ViewModel_Worker_Cell alloc] initWithWorker: worker]];
        }
        success(YES);
        
    } onFailure:^(NSError *errorBlock, NSInteger statusCode) {
        NSLog(@"errorBlock = %@",errorBlock);
        failure(errorBlock, [NSObject new]);
        
    }];
}



- (NSInteger) countWorkers
{
    return self.cellsArray.count;
}


- (ViewModel_Worker_Cell*) cellViewModel:(NSInteger) index
{
    if (index > self.cellsArray.count){
        return nil;
    }
    return self.cellsArray[index];
}


- (void) didSelectAtRowFromTable:(NSIndexPath*) indexPath
{
    ViewModel_Worker_Cell* cellVM = [self cellViewModel:indexPath.row];
    [[Router sharedRouter] openDetailVCwithLinkOnFullCV: cellVM.model.linkOnFullModel];
}

@end

































