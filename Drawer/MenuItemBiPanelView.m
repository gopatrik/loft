//
//  MenuItemBiPanelView.m
//  Loft
//
//  Created by Patrik Göthe on 03/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import "MenuItemBiPanelView.h"

@implementation MenuItemBiPanelView

- (id)initWithWidth:(CGFloat)width {
	self = [super initWithFrame:NSMakeRect(0, 0, width, 30)];
	
    if (self) {
        
    }
    return self;
}

//- (id)initWithFrame:(NSRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code here.
//    }
//    return self;
//}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
	// [[NSColor colorWithRed:0 green:0 blue:0 alpha:0.2] set];
	[[NSColor colorWithRed:0 green:0 blue:0 alpha:0.4] set];
	
	[NSBezierPath fillRect:[self bounds]];
	
    // Drawing code here.
}

@end
