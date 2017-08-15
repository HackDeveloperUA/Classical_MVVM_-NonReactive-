//
//  SMError.m
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SMError.h"

@implementation SMError

#pragma mark - Inits methods

- (instancetype) initWithTitle:(NSString*) title withSubtitle:(NSString*) subTitle withMessage:(NSString*) message
{
    self = [super init];
    if (self) {
        self.title    = title;
        self.subtitle = subTitle;
        self.message  = message;
    }
    return self;
}

- (instancetype) initWithError:(NSError*) standartError
{    
    self = [super init];
    if (self) {
        self.title    = standartError.domain;
        self.subtitle = [NSString stringWithFormat:@"%d",standartError.code];
    }
    return self;
}
@end
