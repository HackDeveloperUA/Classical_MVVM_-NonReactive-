//
//  WorkerBigName_Cell.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>





// ViewModels
#import "ViewModel_WorkerBigName_Cell.h"

// Fraemworks
#import <AFNetworking/UIImage+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>


@interface WorkerBigName_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cvImgView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postInCompnayLabel;

@property (weak, nonatomic) ViewModel_WorkerBigName_Cell* vmWorkerCell;


@end
