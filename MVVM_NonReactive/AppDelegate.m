//
//  AppDelegate.m
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "AppDelegate.h"

// Router
#import "Router.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [self.window makeKeyAndVisible];
    
    [[Router sharedRouter] openLoginVC];
    //[[Router sharedRouter] openWorkersTVC];

    return YES;
}





@end
