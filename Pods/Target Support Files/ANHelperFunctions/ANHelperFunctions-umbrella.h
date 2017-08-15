#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ANDefines.h"
#import "ANHelperFunctions.h"

FOUNDATION_EXPORT double ANHelperFunctionsVersionNumber;
FOUNDATION_EXPORT const unsigned char ANHelperFunctionsVersionString[];

