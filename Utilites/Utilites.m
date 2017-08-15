//
//  Utilites.m
//  MVVM_NonReactive
//
//  Created by Uber on 28/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "Utilites.h"


@implementation Utilites

#pragma mark - UIAlertViewController Helpers


+ (UIAlertController*) getAlertVCError:(id <Protocol_SMErrorAuntefication>) customError{
    
    if ([customError isKindOfClass:[SMErrorAuthentication class]])
    {
      SMErrorAuthentication* err = (SMErrorAuthentication*) customError;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:err.title message:err.subtitle preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    return alert;
    }

    return nil;
}

#pragma mark - UIView Creating/Customizing Helpers


+ (void) aroundView:(UIView*) view withCorner:(CGFloat) corner{

    view.layer.masksToBounds = YES;
    view.layer.cornerRadius  = CGRectGetWidth(view.frame)/corner;
}

+ (void) addShadowForView:(UIView*)view withColor:(UIColor*) colorShadow andOffset:(CGSize) offset andRaius:(CGFloat) radius {
    
    [view.layer setMasksToBounds:NO];
    view.layer.shadowColor   = colorShadow.CGColor;
    view.layer.shadowOffset  = offset;
    view.layer.shadowOpacity = 0.5f;
    view.layer.shadowRadius  = radius;
    [view.layer setShadowPath:[UIBezierPath bezierPathWithRect:view.bounds].CGPath];
    
}

@end



