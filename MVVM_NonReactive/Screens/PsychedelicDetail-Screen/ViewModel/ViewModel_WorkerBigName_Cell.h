//
//  ViewModel_WorkerBigName_Cell.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_BasedWorker_Cell.h"

// Model
#import "WorkerFull.h"


@interface ViewModel_WorkerBigName_Cell : ViewModel_BasedWorker_Cell

@property (nonatomic, strong) NSString* fullNameTitle;
@property (nonatomic, strong) NSString* postInCompany;
@property (nonatomic, strong) WorkerFull* modelWorker;

- (instancetype)initWithWorker:(WorkerFull*) worker;

@end
