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


- (void) setVmWorkerCell:(ViewModel_Worker_Cell *)myVM
{
    _vmWorkerCell = myVM;
    self.fullNameLabel.text = myVM.fullNameTitle;
    self.postLabel.text     = myVM.postTitle;

    
    self.cvPhotoImageView.layer.masksToBounds = YES;
    
    
    NSURL* cvURL = [NSURL URLWithString: myVM.cvImageURL];
    
    [self.cvPhotoImageView setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
        NSLog(@"setImageWithURLRequest image = %@",image);
        self.cvPhotoImageView.image = image;
        self.cvPhotoImageView.layer.cornerRadius  = CGRectGetWidth(self.cvPhotoImageView.frame)/2;

    
    } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
        //
        //NSLog(@"setImageWithURLRequest = %@\n Error = %@",response,error);
        NSLog(@"setImageWithURLRequest = Error = %@",myVM.cvImageURL);

    }];
    
}


@end
