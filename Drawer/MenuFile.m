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

		[self setAction:@selector(open)];
		[self setTarget:self];
		[self setPath:url];
		NSString * title;
		if ([self hasImage]) {
			NSImage *fileimg = [[NSImage alloc] initWithContentsOfURL:url];
			
			[self scaleImage:fileimg toFitWitdth:150];
			[self setImage: fileimg];
			title = @"";
		}else{
			[self setImage: [[NSWorkspace sharedWorkspace] iconForFile:[self path].path]];
			title = [self getTitleFromPath:url];
		}
		
		if ([self hasImage]) {
			MenuItemImageView *itemView = [[MenuItemImageView alloc]initWithTitle:title image:[self image]];
			[self setView:itemView];
		}

//		[itemView addObserver:self forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>]

		
		[self setItemTitle:title];
		
		[self setToolTip:self.path.path.lastPathComponent];
    }

    return self;
}

- (BOOL)isDirectory {
	BOOL isDirectory;
	[[NSFileManager defaultManager] fileExistsAtPath:self.path.path isDirectory:&isDirectory];
	return isDirectory;
}

- (NSString*) getTitleFromPath: (NSURL*) path {
	return 	[[path path] lastPathComponent];
}

- (IBAction)open {
	[[NSWorkspace sharedWorkspace] openFile:self.path.path];
}

- (void) scaleImage:(NSImage*)image toFitWitdth:(CGFloat)w {
	//CGFloat orgH = image.size.height;
	//CGFloat orgW = image.size.width;
	
	[image setScalesWhenResized:YES];
	[image setSize:NSMakeSize(w, 100)];
	
//	NSImageRep *scaledImage = [image bestRepresentationForRect:NSMakeRect(0, 0, w, 100) context:nil hints:nil];
	
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
