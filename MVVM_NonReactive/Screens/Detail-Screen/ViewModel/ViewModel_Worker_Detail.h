//
//  DetailController_VM.h
//  MVVM_NonReactive
//
//  Created by Uber on 09/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WorkerFull.h"


@interface ViewModel_Worker_Detail : NSObject

@property (nonatomic, strong) NSString* fullNameTitle;
@property (nonatomic, strong) NSString* postTitle;
@property (nonatomic, strong) NSString* mainTextTitle;
@property (nonatomic, strong) NSString* cvImageURL;

@property (nonatomic, strong) NSString* linkOnFullCV;

@property (nonatomic, strong) WorkerFull *modelData;

- (instancetype)initWithWorker:(WorkerFull*) worker;
- (instancetype)initWithLinkOnFull_CV_Model:(NSString*) link;

//- (void) getDetailWorkerModelFromServer:(NSString*) link;
- (void) getDetailWorkerModelFromServer:(NSString*) link
                             onSuccess:(void(^)(BOOL successOperation)) success
                              onFailure:(void(^)(NSError* errorBlock,  NSInteger statusCode)) failure;
@end
