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

	NSMutableArray *directories = [[NSMutableArray alloc] init];
	
   // int index = 1;
	for (NSURL *file in filesOnPath) {
		if(![file.path.lastPathComponent hasPrefix:@"."]){
			MenuFile *aFile = [[MenuFile alloc] initWithUrl:file];
            //[aFile setKeyEquivalent: [NSString stringWithFormat:@"%d", index]];
			
			if([aFile isDirectory]){
				NSMenu *submenu = [self createMenuFromFilesInDirectory:aFile.path];
				[aFile setSubmenu:submenu];
				[directories addObject:aFile];
			}else{
				[menu addItem:aFile];
			}
//            index++;

		}
	}
	
	// folders last
	for(MenuFile *directory in directories){
		[menu addItem:directory];
	}
	
	return menu;
}
	

@end
