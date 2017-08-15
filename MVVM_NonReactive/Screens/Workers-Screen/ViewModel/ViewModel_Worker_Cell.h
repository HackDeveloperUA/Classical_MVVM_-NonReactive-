//
//  WorkerCell-VM.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// Model
#import "WorkerShort.h"


@interface ViewModel_Worker_Cell : NSObject

@property (nonatomic, strong) NSString* fullNameTitle;
@property (nonatomic, strong) NSString* postTitle;
@property (nonatomic, strong) NSString* cvImageURL;

@property (nonatomic, strong) WorkerShort* model; // link on model

#pragma mark - Inits methods
- (instancetype)initWithWorker:(WorkerShort*) worker;

@end
