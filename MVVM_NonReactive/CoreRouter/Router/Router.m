//
//  Router.m
//  ViewControllers_Lesson
//
//  Created by Uber on 31/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//


// https://stackoverflow.com/questions/18331751/storyboard-and-custom-init
#import "Router.h"


 // Controllers
 #import "LoginVC.h"
 #import "WorkerTVC.h"
 #import "DetailVC.h"
 
 // ViewModels
 #import "ViewModel_AccountsData.h"
 #import "ViewModel_ListOfWorkers_TableView.h"
 #import "ViewModel_Worker_Detail.h"
 


@implementation Router

#pragma mark - Core

+ (Router*) sharedRouter {
    
    static Router* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Router alloc] init];
        manager.window = [Router getApplicationWindow];
    });
    return manager;
}



#pragma mark - Open Controllers

- (void) openApplication
{
  [self openLoginVC];
}


- (void) openLoginVC
{
    LoginVC* vc = [[LoginVC alloc] init];
    vc.vmAccountsData       = [[ViewModel_AccountsData alloc] init];
    
    [Router setToRootView:vc andAnimationOptions:UIViewAnimationOptionTransitionFlipFromLeft];
}


- (void) openWorkersTVC
{
    if (![self haveControllerForMenuInMemory]){
         [self initInMemoryControllersForMenu];
    }
    [Router setToRootView:self.mainNavContr andAnimationOptions:UIViewAnimationOptionTransitionFlipFromRight];
}


- (void) openDetailVCwithLinkOnFullCV:(NSString*) link;
{
    // Вытащить linkOnCV
    NSLog(@"link = %@",link);
    DetailVC* vc = [DetailVC new];
    vc.vmWorkerDetail = [[ViewModel_Worker_Detail alloc] initWithLinkOnFull_CV_Model: link];
    
    if ([self haveControllerForMenuInMemory]){
        [Router pushTo:vc inNavContr:self.mainNavContr];
    }
}


#pragma mark - Helpers

- (BOOL) haveControllerForMenuInMemory
{
    if (_mainNavContr && _mainWorkersTVC)
        return YES;
    return NO;
}


- (void) initInMemoryControllersForMenu
{
    self.mainWorkersTVC = [[WorkerTVC alloc] init];
    self.mainWorkersTVC.vmListOfWorkers_TableView = [[ViewModel_ListOfWorkers_TableView alloc] init];
    self.mainNavContr = [[UINavigationController alloc] initWithRootViewController: _mainWorkersTVC];

    self.mainNavContr.navigationBar.barTintColor = [UIColor lightGrayColor];
    self.mainNavContr.navigationBar.tintColor = [UIColor whiteColor];
    [self.mainNavContr.navigationBar setTitleTextAttributes:  @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                   NSFontAttributeName:[UIFont fontWithName:@"Avenir Next" size:18]}];
}


- (void) removeFromMemoryControllersForMenu
{
    self.mainWorkersTVC = nil;
    self.mainNavContr   = nil;
}




@end
