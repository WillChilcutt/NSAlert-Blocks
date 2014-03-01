NSAlert+Blocks
==============

My implementation of NSAlert+Blocks turns this:

```Objective-C
-(void)showAlert
{
  NSAlert *alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Some title"];
  [alert setInformativeText:@"Some message"];
  [alert setAlertStyle:NSWarningAlertStyle];
  [alert beginSheetModalForWindow:window
                 	  modalDelegate:self
                   didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:)
                      contextInfo:NULL];
}

...

- (void) alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    //https://developer.apple.com/library/mac/documentation/cocoa/reference/applicationkit/classes/NSAlert_Class/Reference/Reference.html#//apple_ref/doc/constant_group/Button_Return_Values
    int buttonIndex = (int)returnCode - 1000; //The index of the button pressed is 1000+ button number, so just subtract to get the index of the button that was pressed.
    
    //Determine what to do here based off of the button index

    switch (buttonIndex)
    {
        case 0:
            [self handleFirstButtonPressed];
            break;
        case 1:
            [self handleSecondButtonPressed];
            break;
            
        default:
            break;
    }
}


```

into this:

```Objective-C

-(void)showAlert
{
    RIButtonItem *button1 = [RIButtonItem itemWithLabel:@"Button 1"];
    [button1 setAction:^
    {
        [self handleFirstButtonPressed];
    }];
    
    RIButtonItem *button2 = [RIButtonItem itemWithLabel:@"Button 2"];
    [button2 setAction:^
    {
        [self handleSecondButtonPressed];
    }];

    NSAlert *alert = [[NSAlert alloc] initWithTitle:@"Better title"    
                                     andWithMessage:@"better message"    
                                     andWithButtons:@[button1,button2]];
                                 
    [alert showInWindow:self.window]; 
}
```

Reusing the RIButtonItem class from [Jiva DeVoe's](https://twitter.com/JivaDeVoe) [UIAlertView+Blocks category](https://github.com/jivadevoe/UIAlertView-Blocks),
my NSAlert+Blocks category allows for simpler management of when a button gets pressed, and is a smooth transition from iOS to Mac development.

As I am just transitioning to Mac development, please feel free to [contact me](https://twitter.com/willchilcutt) or create an issue with feedback. If you need to set more than the basics of your NSAlert, all setter methods are still exposed.

Thanks!
