//
//  LoginVC.h
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// ViewModels
#import "ViewModel_AccountsData.h"

// Utilites
#import "Utilites.h"

// Fraemworks
#import "MBProgressHUD.h"
#import "ANHelperFunctions.h"


@interface LoginVC : UIViewController

//@property (strong, nonatomic) LoginVC_VM_AccountsData* vm;

@property (strong, nonatomic) ViewModel_AccountsData* vmAccountsData;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end
