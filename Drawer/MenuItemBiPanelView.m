//
//  MenuItemBiPanelView.m
//  Loft
//
//  Created by Patrik Göthe on 03/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import "MenuItemBiPanelView.h"

@implementation MenuItemBiPanelView {
	NSTextField *open;
	NSTextField *trash;
	NSTextField *share;
}

- (id)initWithWidth:(CGFloat)width {
	self = [super initWithFrame:NSMakeRect(0, 0, width, 0)];
	
    if (self) {
		open = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 50, 17)];
		[open setStringValue:@"Open"];
		[self standardizeTextField:open];
		[self addSubview:open];

		trash = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 50, 17)];
		[trash setStringValue:@"Trash"];
		[self standardizeTextField:trash];
		[self addSubview:trash];

		share = [[NSTextField alloc] initWithFrame:NSMakeRect(width-50, 0, 50, 17)];
		[share setStringValue:@"Share"];
		[self standardizeTextField:share];
		[self addSubview:share];
    }
    return self;
}

- (void)standardizeTextField:(NSTextField*)textField{
	[textField setBezeled:NO];
	[textField setDrawsBackground:NO];
	[textField setEditable:NO];
	[textField setSelectable:NO];
}

//- (id)initWithFrame:(NSRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code here.
//    }
//    return self;
//}

- (void)setState:(BOOL)active{
	NSSize size = NSMakeSize(self.frame.size.width, active ? 30:0);

	[NSAnimationContext beginGrouping];
	[[NSAnimationContext currentContext] setDuration:0.2f];
	[[self animator] setFrameSize:size];
	[NSAnimationContext endGrouping];
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
	// [[NSColor colorWithRed:0 green:0 blue:0 alpha:0.2] set];
	[[NSColor colorWithRed:0 green:0 blue:0 alpha:0.05] set];
	
	[NSBezierPath fillRect:[self bounds]];
	
    // Drawing code here.
}

@end
