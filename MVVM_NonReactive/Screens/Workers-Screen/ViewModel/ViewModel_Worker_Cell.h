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

// Networking
//#import <AFNetworking/AFNetworking.h>
//#import <AFNetworking/UIImage+AFNetworking.h>
//#import <AFNetworking/UIImageView+AFNetworking.h>

//@import UIKit;

@interface ViewModel_Worker_Cell : NSObject

@property (nonatomic, strong) NSString* fullNameTitle;
@property (nonatomic, strong) NSString* postTitle;
@property (nonatomic, strong) NSString* cvImageURL;

@property (nonatomic, strong) WorkerShort* model;

- (instancetype)initWithWorker:(WorkerShort*) worker;

@end
