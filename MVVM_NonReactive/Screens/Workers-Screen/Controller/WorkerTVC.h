//
//  WorkerTVC.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
// Models
#import "FRPWeather.h"

// ViewModels
#import "FRPStartViewModel.h"
#import "FRPCityCellViewModel.h"

// Cells
#import "FRPCityCell.h"

// ViewControllers
#import "FRPDetailsViewController.h"
#import "FRPDetailsViewModel.h"
*/

// Models
#import "WorkerShort.h"

// ViewModeles
#import "ViewModel_Worker_Cell.h"
#import "ViewModel_ListOfWorkers_TableView.h"

// Cell
#import "WorkerCell.h"

// Router
//#import "Router.h"

@class Router;

@interface WorkerTVC : UITableViewController

//@property (nonatomic, strong) WorkerController_VM* controllerVM;
@property (nonatomic, strong) ViewModel_ListOfWorkers_TableView* vmListOfWorkers_TableView;

@end
