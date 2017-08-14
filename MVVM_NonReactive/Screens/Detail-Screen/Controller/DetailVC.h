//
//  DetailVC.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// ViewModels
#import "ViewModel_Worker_Detail.h"

@interface DetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *cvImageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postInCompanyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;

@property (strong, nonatomic) ViewModel_Worker_Detail* vmWorkerDetail;

@end
