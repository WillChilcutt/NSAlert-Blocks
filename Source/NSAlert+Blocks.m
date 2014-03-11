//
//  NSAlert+Blocks.m
//  NSAlert+Blocks Example
//
//  Created by Will Chilcutt on 2/28/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import "NSAlert+Blocks.h"
#import <objc/runtime.h>

static void *kNSAlertBlocksButtonsArrayKey;

@implementation NSAlert (Blocks)

#pragma mark Setters and gettings for category properties.

-(void)setButtonsArray:(NSArray *)buttonsArray
{
    objc_setAssociatedObject(self, kNSAlertBlocksButtonsArrayKey, buttonsArray, OBJC_ASSOCIATION_COPY);
}

-(NSArray *)buttonsArray
{
    return objc_getAssociatedObject(self, kNSAlertBlocksButtonsArrayKey);
}

-(id)initWithTitle:(NSString *)title andWithMessage:(NSString *)message andWithButtons:(NSArray *)buttonsArray
{
    self = [self init];
    
    if (self != nil)
    {
        [self setMessageText:title];
        [self setInformativeText:message];
        [self setAlertStyle:NSWarningAlertStyle];
        
        for (RIButtonItem *button in buttonsArray)
        {
            [self addButtonWithTitle:button.label];
        }
        
        self.buttonsArray = [[NSArray alloc] initWithArray:buttonsArray];
    }
    
    return self;
}

-(void)showInWindow:(NSWindow *)window
{
	[self beginSheetModalForWindow:window
                      modalDelegate:self
                     didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:)
                        contextInfo:NULL];
}

- (void) alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    //https://developer.apple.com/library/mac/documentation/cocoa/reference/applicationkit/classes/NSAlert_Class/Reference/Reference.html#//apple_ref/doc/constant_group/Button_Return_Values
    
    int buttonIndex = (int)returnCode - 1000; //The index of the button pressed is 1000+ button number, so just subtract to get the index of the button that was pressed.
    
    RIButtonItem *button = [self.buttonsArray objectAtIndex:buttonIndex];
    
    if (button.action)
    {
        button.action();
    }
}

@end
