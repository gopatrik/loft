//
//  AppDelegate.m
//  Drawer
//
//  Created by Patrik Göthe on 10/28/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//


// LOFT LOFT LOFT LOFT LOFT LOFT LOFT LOFT

#import "AppDelegate.h"
#import "PanelController.h"

@implementation AppDelegate {
	NSFileManager *fileManager;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
}

- (void)awakeFromNib {
	
	fileManager = [NSFileManager defaultManager];
	NSString *desktopPath = [[@"/Users/" stringByAppendingString:NSUserName()] stringByAppendingString:@"/Desktop"];


	statusDrawer = [self createMenuFromFilesInDirectory:desktopPath];
	
	NSLog(@"%@", statusDrawer);
	
	barMenu = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	
	NSBundle *bundle = [NSBundle mainBundle];
	icon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"logo1" ofType:@"png"]];
	alternateIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"logo3" ofType:@"png"]];
	[barMenu setImage:icon];
	[barMenu setAlternateImage:alternateIcon];
	[barMenu setMenu:statusDrawer];
    
   //
//    fixedOriginY = screenHeight - NSRect.size.height - NSRect.origin.y
    
//    NSRect frame = NSMakeRect(20, 0, 200, 200);
//    self.window  = [[NSWindow alloc] initWithContentRect:frame
//                                                     styleMask:NSBorderlessWindowMask
//                                                       backing:NSBackingStoreBuffered
//                                                         defer:NO];
//    [self.window setBackgroundColor:[NSColor whiteColor]];
//    [self.window makeKeyAndOrderFront:NSApp];
    
    //
}

- (NSMenu*) createMenuFromFilesInDirectory:(NSString*)path {
	NSMenu *menu = [[NSMenu alloc] init];
	NSArray *filesOnPath = [fileManager contentsOfDirectoryAtPath:path error:nil];
	
	for (NSString *file in filesOnPath) {
		if(![file hasPrefix:@"."]){
			MenuFile *aFile = [[MenuFile alloc] init];
			[aFile setTitle:file];
			[menu addItem:aFile];
			[aFile setAction:@selector(doSomething:)];
			[aFile setTarget:self];
			[aFile setPath: [[path stringByAppendingString:@"/"] stringByAppendingString:file]];
			
			if([aFile isDirectory]){
				NSMenu *submenu = [self createMenuFromFilesInDirectory:aFile.path];
				[aFile setSubmenu:submenu];
			}
		}
	}

	return menu;
}

- (IBAction)doSomething:(MenuFile*)item{
	NSLog(@"%@", item.path);
	[[NSWorkspace sharedWorkspace] openFile:item.path];
}

// todo
// Hide dock icon
// Make icon
// file images
// display mode, small icons, large icons, no icons.
// settings window

@end
