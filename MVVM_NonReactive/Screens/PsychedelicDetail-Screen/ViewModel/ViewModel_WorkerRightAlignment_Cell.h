//
//  ViewModel_WorkerRightAlignment_Cell.h
//  MVVM_NonReactive
//
//  Created by Uber on 14/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_BasedWorker_Cell.h"

// Model
#import "WorkerFull.h"


@interface ViewModel_WorkerRightAlignment_Cell : ViewModel_BasedWorker_Cell

@property (nonatomic, strong) NSString* fullNameTitle;
@property (nonatomic, strong) NSString* cvImgURL;
@property (nonatomic, strong) NSString* postInCompany;

@property (nonatomic, strong) WorkerFull* modelWorker; // link on model

#pragma mark - Init methods

- (instancetype)initWithWorker:(WorkerFull*) worker;


@end
