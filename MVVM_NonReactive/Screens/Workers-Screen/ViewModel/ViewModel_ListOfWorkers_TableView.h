//
//  WorkerViewModel.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// Cell VM
#import "ViewModel_Worker_Cell.h"

// Model
#import "WorkerShort.h"

// Router
#import "Router.h"

@interface ViewModel_ListOfWorkers_TableView : NSObject

@property (nonatomic, strong) NSMutableArray* cellsArray; // Here store ViewModels
@property (nonatomic, strong) NSMutableArray* modelArray; // Here story Model


#pragma mark - Work with API

- (void) updateWorkerList:(void(^)(BOOL successOperation)) success
                onFailure:(void(^)(NSError* errorBlock,  NSObject* errObj)) failure;


#pragma mark - Methods for TableView work

- (ViewModel_Worker_Cell*) cellViewModel:(NSInteger) index;
- (NSInteger) countWorkers;

#pragma mark  - UI Handlers

- (void) didSelectAtRowFromTable:(NSIndexPath*) indexPath;
- (void) logoutBtnClicked;

@end
