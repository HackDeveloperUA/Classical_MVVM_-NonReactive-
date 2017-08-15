//
//  WorkerCell.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// ViewModels
#import "ViewModel_Worker_Cell.h"

// Fraemworks
#import <AFNetworking/UIImage+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface WorkerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cvPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;

@property (weak, nonatomic) ViewModel_Worker_Cell* vmWorkerCell; // link on cell viewmodel

@end
