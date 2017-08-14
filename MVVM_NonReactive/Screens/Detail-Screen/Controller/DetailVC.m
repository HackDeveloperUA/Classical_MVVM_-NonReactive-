//
//  DetailVC.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "DetailVC.h"

#import <AFNetworking/UIImage+AFNetworking.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fullNameLabel.text       = self.vmWorkerDetail.fullNameTitle;
    self.postInCompanyLabel.text  = self.vmWorkerDetail.postTitle;
    self.mainTextLabel.text       = self.vmWorkerDetail.mainTextTitle;
       
    NSURL* cvURL = [NSURL URLWithString: self.vmWorkerDetail.cvImageURL];
    
    [self.cvImageView setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
        self.cvImageView.image = image;
    
    } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
        NSLog(@"setImageWithURLRequest = %@\n Error = %@",response,error);
    }];
}


- (instancetype)init
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    
    if (self) {
        
    }
    return self;
}

- (void) setVmWorkerDetail:(ViewModel_Worker_Detail *)vmWorkerDetail
{
    _vmWorkerDetail = vmWorkerDetail;
    [_vmWorkerDetail getDetailWorkerModelFromServer:_vmWorkerDetail.linkOnFullCV
                                     onSuccess:^(BOOL successOperation) {
                                         
                                         if (successOperation)
                                             [self setupUIwithSelfViewModel];
                                             
                                     } onFailure:^(NSError *errorBlock, NSInteger statusCode) {
                                        // Print error
                                     }];
}


- (void) setupUIwithSelfViewModel
{
    
    self.fullNameLabel.text       = self.vmWorkerDetail.fullNameTitle;
    self.postInCompanyLabel.text  = self.vmWorkerDetail.postTitle;
    self.mainTextLabel.text       = self.vmWorkerDetail.mainTextTitle;
    

    NSURL* cvURL = [NSURL URLWithString: self.vmWorkerDetail.cvImageURL];
    
    [self.cvImageView setImageWithURLRequest:[NSURLRequest requestWithURL:cvURL] placeholderImage:[UIImage imageNamed:@"placeholder"] success:^(NSURLRequest* request, NSHTTPURLResponse* response, UIImage* image) {
        self.cvImageView.image = image;
        
    } failure:^(NSURLRequest* request, NSHTTPURLResponse* response, NSError* error) {
        NSLog(@"setImageWithURLRequest = %@\n Error = %@",response,error);
    }];

}

@end

