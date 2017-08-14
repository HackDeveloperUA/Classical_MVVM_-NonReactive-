//
//  WorkerFull.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerFull.h"

@implementation WorkerFull

-(instancetype) initWithServerResponse:(NSDictionary*) responseObject{
    
    self = [super init];
    if (self) {
        
        
        self.firstName    = [responseObject objectForKey:@"firstName"];
        self.lastName     = [responseObject objectForKey:@"lastName"];
        self.photoURL     = [responseObject objectForKey:@"photoURL"];
        
        self.thePost      = [responseObject objectForKey:@"thePost"];
        self.mainText     = [responseObject objectForKey:@"mainText"];
        
        self.idNumber = [[responseObject objectForKey:@"id"] integerValue];
    }
    
    return self;
}

#pragma mark - Mapping

+ (FEMMapping *) defaultMapping {
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[WorkerFull class]];
    
    // property from nsobject : keypath from json
    [mapping addAttributesFromDictionary:@{ @"firstName"    : @"firstName",
                                            @"lastName"     : @"lastName",
                                            @"photoURL"     : @"photoURL",
                                            @"thePost"      : @"thePost",
                                            @"mainText"     : @"mainText",
                                            @"idNumber"     : @"id"
                                            }];
    return mapping;
}

@end
