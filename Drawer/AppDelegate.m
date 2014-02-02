//
//  AppDelegate.m
//  Drawer
//
//  Created by Patrik Göthe on 10/28/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//


// LOFT LOFT LOFT LOFT LOFT LOFT LOFT LOFT

#import "AppDelegate.h"
#import "BashCaptain.h"
#import "Bar.h"

@implementation AppDelegate {
    BashCaptain *commander;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// create the menu
	fc = [[FileController alloc]init];
	dropDown = [fc getDesktopAsMenu];
    
    // add menu segment
    [self addSettings:dropDown];
    
    
    [self setBar: [[Bar alloc] initWithMenu:dropDown]];
    
    commander = [[BashCaptain alloc] init];
    [commander setFilesOnDesktop:false];
}

//handler for the quit apple event
//- (void)handleQuitEvent:(NSAppleEventDescriptor*)event withReplyEvent:(NSAppleEventDescriptor*)replyEvent
//{
//    NSLog(@"quitting");
//    [commander setFilesOnDesktop:true];
//    [NSApp terminate:self];
//}

- (void)awakeFromNib {
    //
//    [self watchDesktop];
}

- (void) addSettings:(NSMenu*)menu {
    // Make the lovely line
    [menu addItem:[NSMenuItem separatorItem]];
    
    // Quit
    NSMenuItem *quit = [[NSMenuItem alloc] init];
    [quit setTitle:@"Quit"];
    [quit setAction:@selector(quitApp:)];
    [quit setTarget:self];
    
    // Trash all
    NSMenuItem *trashAll = [[NSMenuItem alloc] init];
    [trashAll setTitle:@"Trash all files"];
    [trashAll setAction:@selector(trashAllFiles:)];
    
    // ShowFiles
    NSMenuItem *showFiles = [[NSMenuItem alloc] init];
    [showFiles setTitle:@"Show Desktop"];
    [showFiles setAction:@selector(showFiles:)];

    [menu addItem:trashAll];
    [menu addItem:showFiles];
    [menu addItem:quit];
}

- (IBAction)quitApp:(id)sender {
    NSLog(@"quit");
    [commander setFilesOnDesktop:true];
    [NSApp terminate:self];
}

- (IBAction)trashAllFiles:(id)sender{
//    [[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation
  //                                               source:[desktopPath stringByDeletingLastPathComponent]
    //                                        destination:@""
      //                                            files:[NSArray arrayWithObject:[desktopPath lastPathComponent]]
        //                                            tag:nil];
}

- (IBAction)showFiles:(NSMenuItem*)sender{
    [commander setFilesOnDesktop:true];
    [sender setTitle:@"Hide Desktop"];
    [sender setAction:@selector(hideFiles:)];
}

- (IBAction)hideFiles:(id)sender{
    [commander setFilesOnDesktop:false];
    [sender setTitle:@"Show Desktop"];
    [sender setAction:@selector(showFiles:)];
}


// todo
// Make icon
// file images
// display mode, small icons, large icons, no icons.
// settings window

@end
