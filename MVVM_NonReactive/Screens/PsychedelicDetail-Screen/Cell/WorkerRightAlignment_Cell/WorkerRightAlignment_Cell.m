//
//  WorkerRightAlignment_Cell.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerRightAlignment_Cell.h"

@implementation WorkerRightAlignment_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setVmWorkerCell:(ViewModel_WorkerRightAlignment_Cell *)myVM
{
    _vmWorkerCell = myVM;
    self.fullNameLabel.text       = myVM.fullNameTitle;
    self.postInCompnayLabel.text  = myVM.postInCompany;
    
    
    self.cvImgView.layer.masksToBounds = YES;
    
    
    NSURL* cvURL = [NSURL URLWithString: myVM.cvImgURL];
    
    [self.cvImgView setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
        
        self.cvImgView.image = image;
        self.cvImgView.layer.cornerRadius  = CGRectGetWidth(self.cvImgView.frame)/2;
        
        
    } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
        NSLog(@"failure error = %@",error);
    }];
    
}

@end
