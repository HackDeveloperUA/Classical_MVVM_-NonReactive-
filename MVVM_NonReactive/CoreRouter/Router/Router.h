//
//  Router.h
//  ViewControllers_Lesson
//
//  Created by Uber on 31/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//


// Base Router Implemetation
#import "CoreRouter.h"


//Controllers
@class LoginVC;
@class WorkerTVC;
@class DetailVC;
@class PsychedelicDetailTVC;

//ViewModels
@class ViewModel_AccountsData;
@class ViewModel_ListOfWorkers_TableView;
@class ViewModel_ListOfPsychedelicWorkers_TableView;
@class ViewModel_Worker_Detail;

//Models
@class WorkerFull;


#import "CoreRouterProtocol.h"

@interface Router : CoreRouter <CoreRouterProtocol>

//  Core
+ (Router*) sharedRouter;

@property (nonatomic, strong) UINavigationController* mainNavContr;
@property (nonatomic, strong) WorkerTVC* mainWorkersTVC;

// Open Controllers
- (void) openApplication;
- (void) openLoginVC;
- (void) openWorkersTVC;
- (void) openDetailVCwithLinkOnFullCV:(NSString*) link;
- (void) openPsychedelicDetailTVC:(WorkerFull*) workerModel;


#pragma mark - Routing method & propierties

// NSUserDefaults properties
@property (nonatomic, assign) BOOL isLogin;

- (void) setIsLoginInUserDefaults:(BOOL) isLogin;
- (BOOL) getIsLoginFromUserDefault;

@end


