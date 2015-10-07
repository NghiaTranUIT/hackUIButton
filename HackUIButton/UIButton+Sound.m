//
//  UIButton+Sound.m
//  HackUIButton
//
//  Created by Nghia Tran on 10/7/15.
//  Copyright © 2015 Fe. All rights reserved.
//

#import "UIButton+Sound.h"
#import <objc/runtime.h>

@implementation UIButton (Sound)
+(void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self exchangeSendAction];
    });
}

+(void) exchangeSendAction
{
    Class class = [self class];
    
    SEL originalSelector = @selector(sendAction:to:forEvent:);
    SEL swizzleSelector = @selector(swizzle_SendAction:to:forEvent:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSelector);
    
    BOOL isSuccess = class_addMethod(class, originalSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (isSuccess)
    {
        class_replaceMethod(class, swizzleSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else
    {
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}

-(void) swizzle_SendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event
{
    // Hack here
    NSLog(@"implement your sound here");
    [self implementYourFeatured];
    
    // Forward to primary implementation.
    [self swizzle_SendAction:action to:target forEvent:event];
}
-(void) implementYourFeatured
{
    
}
@end
