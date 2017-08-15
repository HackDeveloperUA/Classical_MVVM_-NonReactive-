//
//  WorkerCell-VM.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_Worker_Cell.h"


@implementation ViewModel_Worker_Cell


#pragma mark - Inits methods


- (instancetype)initWithWorker:(WorkerShort*) worker
{
    self = [super init];
    if (self) {

        self.model         = worker;
        self.fullNameTitle = [NSString stringWithFormat:@"%@ %@",_model.firstName, _model.lastName];
        self.postTitle     = _model.postInCompany;
        self.cvImageURL    = _model.photoURL;
    }
    return self;
}

@end
