//
//  ViewModel_ListOfPsychedelicWorkers_TableView.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>


// Cell VM
#import "ViewModel_BasedWorker_Cell.h"
#import "ViewModel_WorkerBigName_Cell.h"
#import "ViewModel_WorkerRightAlignment_Cell.h"
#import "ViewModel_WorkerLeftAlignment_Cell.h"

// Cell
#import "WorkerLeftAlignment_Cell.h"
#import "WorkerRightAlignment_Cell.h"
#import "WorkerBigName_Cell.h"


// Model
#import "WorkerFull.h"

// Router
#import "Router.h"


@interface ViewModel_ListOfPsychedelicWorkers_TableView : NSObject

@property (nonatomic, strong) NSMutableArray* vmForCellsArray;  // Here store ViewModels
@property (nonatomic, strong) WorkerFull*     modelWorker;      // Here story Model


#pragma mark - Init methods

- (instancetype)initWithWorker:(WorkerFull*) workerModel;


#pragma mark - Work with API

- (void) generateVMforCells:(void(^)(BOOL successOperation)) success
                  onFailure:(void(^)(NSError* errorBlock)) failure;


#pragma mark - Methods for TableView work

- (ViewModel_BasedWorker_Cell*) cellViewModel:(NSInteger) index;
- (NSInteger) countWorkers;


#pragma mark - UI Handlers

- (void) didSelectAtRowFromTable:(NSIndexPath*) indexPath;



@end







