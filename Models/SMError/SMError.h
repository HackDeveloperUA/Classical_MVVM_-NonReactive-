//
//  SMError.h
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocol_SMError.h"


/*
  Объект который по умолчанию мы будем передавать в Utilites, для получения UIAlertViewController
 
 The object which by default we will transfer to Utilites to getting UIAlertViewController
*/

@interface SMError : NSObject <Protocol_SMError>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *message;

#pragma mark - Inits methods

- (instancetype) initWithTitle:(NSString*) title withSubtitle:(NSString*) subTitle withMessage:(NSString*) message;

- (instancetype) initWithError:(NSError*) standartError;

@end
