//
//  MainWindowController.m
//  NSAlert+Blocks Example
//
//  Created by Will Chilcutt on 2/28/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import "MainWindowController.h"
#import "NSAlert+Blocks.h"

@implementation MainWindowController

- (IBAction)handleShowAlertButtonPressed:(id)sender
{
    RIButtonItem *button1 = [RIButtonItem itemWithLabel:@"Button 1"];
    [button1 setAction:^
    {
        NSLog(@"Pressed button 1");
    }];
    
    RIButtonItem *button2 = [RIButtonItem itemWithLabel:@"Button 2"];
    [button2 setAction:^
     {
         NSLog(@"Pressed button 2");
     }];
    
    NSAlert *alert = [[NSAlert alloc] initWithTitle:@"title"
                                     andWithMessage:@"message"
                                     andWithButtons:@[button1,button2]];
    
    [alert showInWindow:self.window];
}

@end
