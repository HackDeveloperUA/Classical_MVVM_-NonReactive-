//
//  WorkerCell.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

// ViewModels
#import "WorkerCell_VM.h"

@interface WorkerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cvPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;

@property (weak, nonatomic) WorkerCell_VM* myVM;

@end
