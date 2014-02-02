//
//  FileController.m
//  Loft
//
//  Created by Patrik Göthe on 01/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import "FileController.h"


@implementation FileController {
	NSURL *desktopPath;
}

- (id)init
{
    self = [super init];
    if (self) {
        desktopPath = [self getDesktopPath];
    }
    return self;
}

- (NSURL*)getDesktopPath {
	return [[[NSURL alloc] initFileURLWithPath:NSHomeDirectory() isDirectory:YES] URLByAppendingPathComponent:@"Desktop"];
	
	//[NSHomeDirectory() stringByAppendingString:@"/Desktop"];
}

- (NSMenu*)getDesktopAsMenu {
	return [self createMenuFromFilesInDirectory:desktopPath];
}

- (NSString*) getTitleFromPath: (NSURL*) path {
	return 	[[path path] lastPathComponent];
}


// recursive, ops
- (NSMenu*) createMenuFromFilesInDirectory:(NSURL*)path {
	NSMenu *menu = [[NSMenu alloc] init];
//	NSArray *filesOnPath = [self contentsOfDirectoryAtPath:path.path error:nil];
	NSArray *filesOnPath = [self contentsOfDirectoryAtURL:path includingPropertiesForKeys:nil options:NO error:nil];

    int index = 1;
	for (NSURL *file in filesOnPath) {
		if(![file.path.lastPathComponent hasPrefix:@"."]){
			MenuFile *aFile = [[MenuFile alloc] init];
			[aFile setItemTitle:[self getTitleFromPath:file]];
			[aFile setAction:@selector(open)];
			[aFile setTarget:aFile];
			[aFile setPath:file];
            [aFile setKeyEquivalent: [NSString stringWithFormat:@"%d", index]];
			
			if ([aFile hasImage]) {
				NSImage *fileimg = [[NSImage alloc] initWithContentsOfURL:file];
				[fileimg setSize:NSMakeSize(40, 40)];
				[aFile setImage: fileimg];
			}else{
				[aFile setImage: [[NSWorkspace sharedWorkspace] iconForFile:[aFile path].path]];
			}
			
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
	

@end
