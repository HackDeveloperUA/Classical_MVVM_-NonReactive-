//
//  LoginVC-VM-AccountsData.m
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ViewModel_AccountsData.h"

@implementation ViewModel_AccountsData


- (void) signInBtnClicked:(NSString*)login
                  andPass:(NSString*) pass
               andHandler:(void(^)(BOOL successOperation)) success
                onFailure:(void(^)(NSError* errorBlock, SMErrorAuthentication* errObjc)) failure
{
    [[ServerManager sharedManager] getAccountsData:^(NSDictionary *dictWithLoginAndPassword) {
        
        // Проверка на правильность логина и пароля
        if ([[dictWithLoginAndPassword objectForKey:login] isEqualToString:pass])
        {
            success(YES);
        }
        else
        {
          SMErrorAuthentication* err = [[SMErrorAuthentication alloc] initWithTitle:@"Ошибка"
                                                                       withSubtitle:@"Неправильный логин или пароль"
                                                                        withMessage:@""];
            failure(nil,err);
        }
        
    } onFailure:^(NSError *errorBlock, NSInteger statusCode) {
        
        SMErrorAuthentication* err = [[SMErrorAuthentication alloc] initWithTitle:[NSString stringWithFormat:@"Ошибка %d",statusCode]
                                                                     withSubtitle:errorBlock.domain
                                                                      withMessage:@""];
        failure(errorBlock,err);
    }];
    
}


@end
