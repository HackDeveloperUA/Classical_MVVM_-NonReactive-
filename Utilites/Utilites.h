//
//  Utilites.h
//  MVVM_NonReactive
//
//  Created by Uber on 28/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "Protocol-SMErrorAuntefication.h"

// Errors
#import "SMError.h"
#import "SMErrorAuthentication.h"

@import UIKit;



@interface Utilites : NSObject

+ (UIAlertController*) getAlertVCError:(id <Protocol_SMErrorAuntefication>) customError;
+ (void) aroundView:(UIView*) view withCorner:(CGFloat) corner;
+ (void) addShadowForView:(UIView*)view withColor:(UIColor*) colorShadow andOffset:(CGSize) offset andRaius:(CGFloat) radius;

@end
