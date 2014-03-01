//
//  NSAlert+Blocks.h
//  NSAlert+Blocks Example
//
//  Created by Will Chilcutt on 2/28/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RIButtonItem.h"

@interface NSAlert (Blocks)

@property (copy) NSArray *buttonsArray;

-(id)initWithTitle:(NSString *)title andWithMessage:(NSString *)message andWithButtons:(NSArray *)buttonsArray;
-(void)showInWindow:(NSWindow *)window;

@end
