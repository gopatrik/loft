//
//  MenuFile.h
//  Drawer
//
//  Created by Patrik Göthe on 10/29/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MenuFile : NSMenuItem

@property (nonatomic) NSURL* path;

- (BOOL)isDirectory;
- (IBAction)open;
- (void) setItemTitle: (NSString*)title;
- (BOOL) hasImage;
- (id) initWithUrl:(NSURL*)url;

@end
