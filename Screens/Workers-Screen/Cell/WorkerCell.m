//
//  WorkerCell.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerCell.h"

@implementation WorkerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) setMyVM:(WorkerCell_VM *)myVM
{
    _myVM = myVM;
    self.fullNameLabel.text = myVM.fullNameTitle;
    self.postLabel.text     = myVM.postTitle;
#warning  Хотя запрос на скачивание можно делать и тут
    self.cvPhotoImageView.image = myVM.cvImage;
}


@end
