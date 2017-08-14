//
//  ViewModel_WorkerBigName_Cell.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_WorkerBigName_Cell.h"

@implementation ViewModel_WorkerBigName_Cell

- (instancetype)initWithWorker:(WorkerFull*) worker
{
    self = [super init];
    if (self) {
        
        self.modelWorker   = worker;
        self.fullNameTitle = [NSString stringWithFormat:@"%@ %@", _modelWorker.firstName, _modelWorker.lastName];
        self.postInCompany = _modelWorker.thePost;
    }
    return self;
}

@end
