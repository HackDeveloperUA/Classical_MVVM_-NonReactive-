//
//  Protocol_SMError.h
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
  Тут описана общая концепция объекта ошибки
  Here are described the General concept of an object error
*/

@protocol Protocol_SMError <NSObject>

@required

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *message;

@end
