//
//  PsychedelicDetailTVC.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// model
#import "WorkerFull.h"

// ViewModel - Cells
#import "ViewModel_BasedWorker_Cell.h"

// ViewModel - Controller
#import "ViewModel_ListOfPsychedelicWorkers_TableView.h"



/*
 RU:
 Экран на котором показано, как MVVM работает с ячейками разных типо и разных ViewModel.
 
 EN:
 A screen that shows you how MVVM works with cells of different types and different ViewModel.
 */


@class Router;

@interface PsychedelicDetailTVC : UITableViewController

// link on ViewModels
@property (nonatomic, strong) ViewModel_ListOfPsychedelicWorkers_TableView* vmListOfPsychedelicWorkers_TableView;

- (instancetype)initWithVM:(ViewModel_ListOfPsychedelicWorkers_TableView*) vm;

@end
