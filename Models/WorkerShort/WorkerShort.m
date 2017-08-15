//
//  WorkerShort.m
//  MVVM_NonReactive
//
//  Created by Uber on 08/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "WorkerShort.h"

@implementation WorkerShort

#pragma mark - Inits methods
- (instancetype) initWithServerResponse:(NSDictionary*) response
{
    self = [super init];
    if (self) {
        self.firstName         = [response objectForKey:@"firstName"];
        self.lastName          = [response objectForKey:@"lastName"];
        self.postInCompany     = [response objectForKey:@"postInCompany"];
        self.photoURL          = [response objectForKey:@"photoURL"];
        self.linkOnFullModel   = [response objectForKey:@"linkOnFullCV"];
        self.idNumber = [[response objectForKey:@"id"] integerValue];
    }
    return self;
}


#pragma mark - Mapping

+ (FEMMapping *) defaultMapping {
    FEMMapping* mapping = [[FEMMapping alloc] initWithObjectClass:[WorkerShort class]];
    // property from nsobject : keypath from json
    [mapping addAttributesFromDictionary:@{ @"firstName"     : @"firstName",
                                            @"lastName"      : @"lastName",
                                            @"postInCompany" : @"postInCompany",
                                            @"photoURL"      : @"photoURL",
                                            @"linkOnFullModel" : @"linkOnFullCV",
                                            @"idNumber"      : @"id"
                                            }];
    return mapping;
}
@end
