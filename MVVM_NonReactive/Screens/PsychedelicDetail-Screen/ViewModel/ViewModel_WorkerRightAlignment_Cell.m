//
//  ViewModel_WorkerRightAlignment_Cell.m
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_WorkerRightAlignment_Cell.h"

@implementation ViewModel_WorkerRightAlignment_Cell

#pragma mark - Init methods

- (instancetype)initWithWorker:(WorkerFull*) worker
{
    self = [super init];
    if (self) {
        
        self.modelWorker   = worker;
        self.fullNameTitle = [NSString stringWithFormat:@"%@ %@", _modelWorker.firstName, _modelWorker.lastName];
        self.postInCompany = _modelWorker.postInCompany;
        self.cvImgURL      = _modelWorker.photoURL;
    }
    return self;
}

@end
