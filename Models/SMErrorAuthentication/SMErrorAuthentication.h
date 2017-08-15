//
//  SMErrorAuthentication.h
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SMError.h"
#import "Protocol-SMErrorAuntefication.h"

/*
  Объект который  мы будем передавать в Utilites, для получения UIAlertViewController.
  В случае специфической ошибки в процессе аунтитификации.
 
 The object that we pass in Utilites to realise UIAlertViewController.
 In the case of specific errors in the authentication process.
 */

@interface SMErrorAuthentication : SMError <Protocol_SMErrorAuntefication>

@end
