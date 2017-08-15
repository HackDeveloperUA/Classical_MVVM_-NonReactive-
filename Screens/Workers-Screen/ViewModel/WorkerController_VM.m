//
//  WorkerViewModel.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerTVC_VM.h"

#import "ServerManager.h"

@implementation WorkerTVC_VM


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
            [self.cellsArray addObject: [[WorkerCell_VM alloc] initWithWorker: worker]];
        }
        success(YES);
        
    } onFailure:^(NSError *errorBlock, NSInteger statusCode) {
        NSLog(@"errorBlock = %@",errorBlock);
        failure(errorBlock, [NSObject new]);
        
    }];
}


- (NSInteger) numberOfCities
{
    return self.cellsArray.count;
}


- (WorkerCell_VM*) cellViewModel:(NSInteger) index
{
    if (index > self.cellsArray.count){
        return nil;
    }
    return self.cellsArray[index];
}



@end
