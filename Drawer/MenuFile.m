//
//  MenuFile.m
//  Drawer
//
//  Created by Patrik Göthe on 10/29/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import "MenuFile.h"

@implementation MenuFile

- (id) initWithUrl:(NSURL *)url {
	self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)isDirectory {
	BOOL isDirectory;
	[[NSFileManager defaultManager] fileExistsAtPath:self.path.path isDirectory:&isDirectory];
	return isDirectory;
}

- (IBAction)open {
	[[NSWorkspace sharedWorkspace] openFile:self.path.path];

}

- (void) setItemTitle: (NSString*)file {
	NSString *fileType = [file pathExtension];
	if([file length] > 20){
		[self setTitle: [[file substringWithRange:NSMakeRange(0, 14)] stringByAppendingString:[NSString stringWithFormat: @"[...].%@", ([fileType length] > 3) ? [fileType substringWithRange:NSMakeRange(0, 3)] : fileType]]];
	}else{
		[self setTitle:file];
	}
}

- (BOOL) hasImage {
	CFStringRef fileExtension = (__bridge CFStringRef) [[self path] pathExtension];
	CFStringRef fileUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension, NULL);
	
	if (UTTypeConformsTo(fileUTI, kUTTypeImage)){
		return YES;
	}
	return NO;
}

@end
