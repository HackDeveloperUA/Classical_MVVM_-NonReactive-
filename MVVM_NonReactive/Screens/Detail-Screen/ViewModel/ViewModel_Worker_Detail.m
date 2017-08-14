//
//  DetailController_VM.m
//  MVVM_NonReactive
//
//  Created by Uber on 09/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_Worker_Detail.h"

#import "ServerManager.h"


@implementation ViewModel_Worker_Detail


#pragma mark - Initis methods

- (instancetype)initWithWorker:(WorkerFull*) worker
{
    self = [super init];
    if (self) {
        
        _modelData = worker;
        
        self.fullNameTitle =  [NSString stringWithFormat:@"%@ %@",_modelData.firstName, _modelData.lastName];
        self.postTitle     = self.modelData.thePost;
        self.mainTextTitle = self.modelData.mainText;
        self.cvImageURL    = self.modelData.photoURL;
        
    }
    return self;
}


- (instancetype)initWithLinkOnFull_CV_Model:(NSString*) link
{
    self = [super init];
    if (self) {
        
        self.linkOnFullCV = link;
    }
    return self;
}

#pragma mark - Helpers

- (void) setModelData:(WorkerFull *)modelData
{
    _modelData = modelData;
    [self setDataToSelfProperty:_modelData];
}

- (void) setDataToSelfProperty:(WorkerFull*) model
{
    self.fullNameTitle =  [NSString stringWithFormat:@"%@ %@", model.firstName, model.lastName];
    self.postTitle     = model.thePost;
    self.mainTextTitle = model.mainText;
    self.cvImageURL    = model.photoURL;
}



#pragma mark - Server

-(void) getDetailWorkerModelFromServer:(NSString*) link
                             onSuccess:(void(^)(BOOL successOperation)) success
                             onFailure:(void(^)(NSError* errorBlock,  NSInteger statusCode)) failure
{
    __weak ViewModel_Worker_Detail* weakSelf = self;
    
    [[ServerManager sharedManager] getFullInfoByWorkers:link
                                              onSuccess:^(WorkerFull *worker) {
                                                  
                                                  weakSelf.modelData = worker;
                                                  [weakSelf setDataToSelfProperty:  weakSelf.modelData];
                                                
                                                  if (weakSelf.modelData)
                                                      success(YES);
                                                  
                                              } onFailure:^(NSError *errorBlock, NSInteger statusCode) {
                                                  
                                                  NSLog(@"Not found detail cv");
                                                  failure(errorBlock, statusCode);
                                              }];
}

@end
