//
//  WorkerBigName_Cell.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerBigName_Cell.h"

@implementation WorkerBigName_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Setting data to cell`s view
- (void) setVmWorkerCell:(ViewModel_WorkerBigName_Cell *)myVM
{
    _vmWorkerCell = myVM;
    
    self.fullNameLabel.text      = myVM.fullNameTitle;
    self.postInCompnayLabel.text = myVM.postInCompany;
}

@end
