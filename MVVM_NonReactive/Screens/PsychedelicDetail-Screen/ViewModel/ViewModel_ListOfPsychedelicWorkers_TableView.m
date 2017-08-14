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


- (instancetype)initWithWorker:(WorkerFull*) workerModel
{
    self = [super init];
    if (self) {
        self.vmForCellsArray = [NSMutableArray array];
        self.modelWorker = workerModel;
    }
    return self;
}


- (void) generateVMforCells:(void(^)(BOOL successOperation)) success
                  onFailure:(void(^)(NSError* errorBlock)) failure
{
    NSInteger countLeftAlignmentCell  =  RAND_FROM_TO(0, 3);
    NSInteger countRightAlignmentCell =  RAND_FROM_TO(0, 3);
    NSInteger countBigNameCell        =  RAND_FROM_TO(0, 3);

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

- (NSInteger) countWorkers
{
    return self.vmForCellsArray.count;
}


- (ViewModel_BasedWorker_Cell*) cellViewModel:(NSInteger) index
{
    if (index > self.vmForCellsArray.count){
        return nil;
    }
    return self.vmForCellsArray[index];
}

- (void) didSelectAtRowFromTable:(NSIndexPath*) indexPath
{
    //ViewModel_Worker_Cell* cellVM = [self cellViewModel:indexPath.row];
}


#pragma mark - private method


@end
