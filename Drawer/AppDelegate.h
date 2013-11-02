//
//  AppDelegate.h
//  Drawer
//
//  Created by Patrik Göthe on 10/28/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MenuFile.h"
#import "Bar.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSMenu *dropDown;
	NSStatusItem *barMenu;
	NSImage *icon;
	NSImage *alternateIcon;
}
// LOFT
// @property (assign) IBOutlet NSWindow *window;

@property (nonatomic) Bar *bar;
@property (strong, retain) NSWindow *window;

- (IBAction)doSomething:(MenuFile*)item;

@end
