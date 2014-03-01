//
//  AppDelegate.m
//  NSAlert+Blocks Example
//
//  Created by Will Chilcutt on 2/28/14.
//  Copyright (c) 2014 ChilcuttApps. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()
{
    MainWindowController *mainWindowController;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    mainWindowController = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
    [mainWindowController showWindow:self];
    [self setWindow:mainWindowController.window];
}

@end
