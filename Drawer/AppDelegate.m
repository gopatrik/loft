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
	NSFileManager *fileManager;
    BashCaptain *commander;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
    
    //install the custom quit event handler
//    NSAppleEventManager* appleEventManager = [NSAppleEventManager sharedAppleEventManager];
//    [appleEventManager setEventHandler:self andSelector:@selector(handleQuitEvent:withReplyEvent:) forEventClass:kCoreEventClass andEventID:kAEQuitApplication];
    
    fileManager = [NSFileManager defaultManager];
	NSString *desktopPath = [[@"/Users/" stringByAppendingString:NSUserName()] stringByAppendingString:@"/Desktop"];
    
	dropDown = [self createMenuFromFilesInDirectory:desktopPath];
    
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
}

- (NSMenu*) createMenuFromFilesInDirectory:(NSString*)path {
	NSMenu *menu = [[NSMenu alloc] init];
	NSArray *filesOnPath = [fileManager contentsOfDirectoryAtPath:path error:nil];
	
    int index = 1;
	for (NSString *file in filesOnPath) {
		if(![file hasPrefix:@"."]){
			MenuFile *aFile = [[MenuFile alloc] init];
            NSString *fileType = [file pathExtension];
            if([file length] > 20){
                [aFile setTitle: [[file substringWithRange:NSMakeRange(0, 14)] stringByAppendingString:[NSString stringWithFormat: @"[...].%@", ([fileType length] > 3) ? [fileType substringWithRange:NSMakeRange(0, 3)] : fileType]]];
            }else{
                [aFile setTitle:file];
            }

			[aFile setAction:@selector(doSomething:)];
			[aFile setTarget:self];
			[aFile setPath: [[path stringByAppendingString:@"/"] stringByAppendingString:file]];
            [aFile setKeyEquivalent: [NSString stringWithFormat:@"%d", index]];
            [aFile setImage: [[NSWorkspace sharedWorkspace] iconForFileType:fileType]];
			
			if([aFile isDirectory]){
				NSMenu *submenu = [self createMenuFromFilesInDirectory:aFile.path];
				[aFile setSubmenu:submenu];
			}
            
            index++;
            
            [menu addItem:aFile];
		}
	}

	return menu;
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
    
    
    // order of addition matters
    [menu addItem:trashAll];
    [menu addItem:quit];
}

- (IBAction)quitApp:(id)sender {
    NSLog(@"quit");
    [commander setFilesOnDesktop:true];
    [NSApp terminate:self];
}

- (IBAction)doSomething:(MenuFile*)item{
	NSLog(@"%@", item.path);
	[[NSWorkspace sharedWorkspace] openFile:item.path];
}

- (IBAction)trashAllFiles:(id)sender{
    //
}

- (IBAction)ShowFiles:(id)sender{
    //
}


// todo
// Make icon
// file images
// display mode, small icons, large icons, no icons.
// settings window

@end
