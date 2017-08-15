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

/*
   RU:
   Экран на котором происходит процесс псевдо-аутентификации
   
   EN:
   The screen where the process of pseudo-authentication.
*/

@interface LoginVC : UIViewController

// link on viewmodel
@property (strong, nonatomic) ViewModel_AccountsData* vmAccountsData;
@property (strong, nonatomic) MBProgressHUD *HUD;

@end
