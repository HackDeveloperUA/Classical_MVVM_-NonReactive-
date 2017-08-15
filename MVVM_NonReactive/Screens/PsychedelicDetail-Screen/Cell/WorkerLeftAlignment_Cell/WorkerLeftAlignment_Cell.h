//
//  WorkerLeftAlignment_Cell.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// ViewModels
#import "ViewModel_WorkerLeftAlignment_Cell.h"

// Fraemworks
#import <AFNetworking/UIImage+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>


@interface WorkerLeftAlignment_Cell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *cvImgView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postInCompanyLabel;


@property (weak, nonatomic) ViewModel_WorkerLeftAlignment_Cell* vmWorkerCell; // link on cell ViewModel

@end
