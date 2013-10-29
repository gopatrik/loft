//
//  MenuFile.m
//  Drawer
//
//  Created by Patrik Göthe on 10/29/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import "MenuFile.h"

@implementation MenuFile

- (BOOL)isDirectory{
	BOOL isDirectory;
	[[NSFileManager defaultManager] fileExistsAtPath:self.path isDirectory:&isDirectory];
	return isDirectory;
}

@end
