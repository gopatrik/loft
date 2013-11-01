//
//  PanelController.m
//  Loft
//
//  Created by Patrik Göthe on 30/10/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import "PanelController.h"

@interface PanelController ()

@end

@implementation PanelController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        NSLog(@"panel created");
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
