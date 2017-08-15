//
//  WorkerViewModel.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// Cell VM
#import "WorkerCell_VM.h"

// Model
#import "WorkerShort.h"

@interface WorkerTVC_VM : NSObject

@property (nonatomic, strong) NSMutableArray* cellsArray; // Here store ViewModels
@property (nonatomic, strong) NSMutableArray* modelArray; // Here story Model

- (void) updateWorkerList:(void(^)(BOOL successOperation)) success
                onFailure:(void(^)(NSError* errorBlock,  NSObject* errObj)) failure;

- (WorkerCell_VM*) cellViewModel:(NSInteger) index;


/*
@property (nonatomic, weak)   FRPWeathManager* weatherManager;
@property (nonatomic, strong) NSMutableArray* cellsArray;
@property (nonatomic, strong) NSMutableArray* weatherArray;

@property (nonatomic, strong) FRPDetailsViewModel* detailsViewModel; // -


- (void) updateWeather:(void(^)(BOOL successOperation)) success
             onFailure:(void(^)(NSError* errorBlock,  NSObject* errObj)) failure;

- (NSInteger) numberOfCities;

- (FRPCityCellViewModel*) cellViewModel:(NSInteger) index;
- (FRPDetailsViewModel*) detailsViewModel:(NSInteger) index;

- (instancetype)initWithWeatherManager:(FRPWeathManager*) manager;
*/
@end
