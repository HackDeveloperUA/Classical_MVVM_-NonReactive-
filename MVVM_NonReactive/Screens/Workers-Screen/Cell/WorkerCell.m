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


- (void) setVmWorkerCell:(ViewModel_Worker_Cell *) vm
{
    _vmWorkerCell = vm;
    self.fullNameLabel.text = vm.fullNameTitle;
    self.postLabel.text     = vm.postTitle;

    
    self.cvPhotoImageView.layer.masksToBounds = YES;
    
    
    NSURL* cvURL = [NSURL URLWithString: vm.cvImageURL];
    
    [self.cvPhotoImageView setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {

        self.cvPhotoImageView.image = image;
        self.cvPhotoImageView.layer.cornerRadius  = CGRectGetWidth(self.cvPhotoImageView.frame)/2;

    
    } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
        
        NSLog(@"- (void) setVmWorkerCell:(ViewModel_Worker_Cell *) vm; setImageWithURLRequest = Error = %@",vm.cvImageURL);

    }];
    
}


@end
