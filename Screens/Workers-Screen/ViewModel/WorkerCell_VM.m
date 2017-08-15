//
//  WorkerCell-VM.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerCell_VM.h"


@implementation WorkerCell_VM

- (instancetype)initWithWorker:(WorkerShort*) worker
{
    self = [super init];
    if (self) {
        
        
        self.fullNameTitle = [NSString stringWithFormat:@"%@ %@",worker.firstName,worker.lastName];
        self.postTitle = worker.postInCompany;
        
        NSURL* cvURL = [NSURL URLWithString: worker.photoURL];
        
        
        [[UIImageView new] setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
            self.cvImage = image;
        } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
            //
            NSLog(@"setImageWithURLRequest = %@\n Error = %@",response,error);
        }];
    }
    return self;
}

@end
