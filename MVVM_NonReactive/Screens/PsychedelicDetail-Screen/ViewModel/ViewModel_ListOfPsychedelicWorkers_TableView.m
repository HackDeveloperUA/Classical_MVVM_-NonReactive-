//
//  ViewModel_ListOfPsychedelicWorkers_TableView.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_ListOfPsychedelicWorkers_TableView.h"


#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))


@implementation ViewModel_ListOfPsychedelicWorkers_TableView


#pragma mark - Init methods

- (instancetype)initWithWorker:(WorkerFull*) workerModel
{
    self = [super init];
    if (self) {
        self.vmForCellsArray = [NSMutableArray array];
        self.modelWorker = workerModel;
    }
    return self;
}


#pragma mark - Work with API


- (void) generateVMforCells:(void(^)(BOOL successOperation)) success
                  onFailure:(void(^)(NSError* errorBlock)) failure
{
    NSInteger countLeftAlignmentCell  =  RAND_FROM_TO(1, 5);
    NSInteger countRightAlignmentCell =  RAND_FROM_TO(1, 5);
    NSInteger countBigNameCell        =  RAND_FROM_TO(1, 5);

    for (int i = 0; i <= (countLeftAlignmentCell+countRightAlignmentCell+countBigNameCell); i++)
    {
        if (i % 2 == 0)
        {
           if (arc4random() % 2 == 0)
            [self.vmForCellsArray addObject:[[ViewModel_WorkerLeftAlignment_Cell alloc] initWithWorker:_modelWorker]];
           else
            [self.vmForCellsArray addObject:[[ViewModel_WorkerRightAlignment_Cell alloc] initWithWorker:_modelWorker]];
        } else {
                  if (arc4random() % 2 == 0)
                  [self.vmForCellsArray addObject:[[ViewModel_WorkerBigName_Cell alloc]initWithWorker:_modelWorker]];
               }
    }
}

#pragma mark - Methods for TableView work

- (NSInteger) countWorkers {
    return self.vmForCellsArray.count;
}


- (ViewModel_BasedWorker_Cell*) cellViewModel:(NSInteger) index {
    
    if (index > self.vmForCellsArray.count){
        return nil;
    }
    return self.vmForCellsArray[index];
}

#pragma mark - UI Handlers

- (void) didSelectAtRowFromTable:(NSIndexPath*) indexPath {
    

}




@end
