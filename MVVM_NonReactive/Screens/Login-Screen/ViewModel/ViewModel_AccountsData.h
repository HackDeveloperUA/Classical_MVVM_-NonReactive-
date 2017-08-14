//
//  LoginVC-VM-AccountsData.h
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// ServerManager
#import "ServerManager.h"

// Error Handlers
#import "SMErrorAuthentication.h"

@interface ViewModel_AccountsData : NSObject

- (void) signInBtnClicked:(NSString*)login
                  andPass:(NSString*) pass
               andHandler:(void(^)(BOOL successOperation)) success
                onFailure:(void(^)(NSError* errorBlock, SMErrorAuthentication* errObjc)) failure;

@end
