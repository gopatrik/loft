//
//  BashCaptain.m
//  Loft
//
//  Created by Patrik Göthe on 02/11/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import "BashCaptain.h"

@implementation BashCaptain
-(BOOL) setFilesOnDesktop:(BOOL)visible {
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/defaults"];
    NSString *visibility = visible ? @"true" : @"false";
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"write", @"com.apple.finder" , @"CreateDesktop", @"-bool", visibility, nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
//    NSData *data;
//    data = [file readDataToEndOfFile];
//    
//    NSString *string;
//    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
//    NSLog (@"grep returned:\n%@", string);
    [self restartFinder];
    
    return true;
}

-(void) restartFinder {
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/killall"];
    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"Finder", nil];
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
}
@end
