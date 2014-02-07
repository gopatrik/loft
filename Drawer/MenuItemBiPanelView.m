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
	BOOL animation;
}

- (id)initWithWidth:(CGFloat)width {
	animation = NO;
	self = [super initWithFrame:NSMakeRect(0, 0, width, 0)];
	
    if (self) {
		open = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 50, 25)];
		[open setStringValue:@"Open"];
		[self standardizeTextField:open];
		[self addSubview:open];

		trash = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 0, 50, 25)];
		[trash setStringValue:@"Trash"];
		[self standardizeTextField:trash];
		[self addSubview:trash];

		share = [[NSTextField alloc] initWithFrame:NSMakeRect(width-50, 0, 50, 25)];
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
	[textField setFont:[NSFont fontWithName:@"helvetica" size:16]];
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

	if(animation){
		[NSAnimationContext beginGrouping];
		[[NSAnimationContext currentContext] setDuration:0.2f];
		[[self animator] setFrameSize:size];
		[NSAnimationContext endGrouping];
		[self setNeedsDisplay:YES];
	}else{
		[self setFrameSize:size];
	}
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	
	// [[NSColor colorWithRed:0 green:0 blue:0 alpha:0.2] set];
	[[NSColor colorWithRed:1 green:1 blue:1 alpha:0.7] set];
	
	[NSBezierPath fillRect:[self bounds]];
	
    // Drawing code here.
}

@end
