//
//  Bar.m
//  Loft
//
//  Created by Patrik Göthe on 02/11/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import "Bar.h"

@implementation Bar
- (id)initWithMenu:(NSMenu*)menu
{
    self = [super init];
    if (self) {
        self.barMenu = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        
        NSBundle *bundle = [NSBundle mainBundle];
        self.icon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"logo5aa" ofType:@"png"]];
        self.alternateIcon = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"logo5bb" ofType:@"png"]];
        [self.barMenu setImage:self.icon];
        [self.barMenu setAlternateImage:self.alternateIcon];
        [self.barMenu setMenu:menu];
        [self.barMenu setHighlightMode:YES];
    }
    return self;
}
@end
