//
//  WorkerFull.h
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FEMMapping.h"


@interface WorkerFull : NSObject

@property (nonatomic, assign) NSInteger idNumber;

@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, strong) NSString* photoURL;

@property (nonatomic, strong) NSString* postInCompany;
@property (nonatomic, strong) NSString* mainText;


#pragma mark - Inits methods
- (instancetype) initWithServerResponse:(NSDictionary*) responseObject;

#pragma mark - Mapping
+ (FEMMapping *)defaultMapping;

@end
