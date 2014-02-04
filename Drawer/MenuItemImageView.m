//
//  MenuItemView.m
//  Loft
//
//  Created by Patrik Göthe on 02/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import "MenuItemImageView.h"
#import "MenuItemBiPanelView.h"

@implementation MenuItemImageView {
	BOOL active;
	NSImageView *imageView;
	CGFloat mainWidth;
	CGFloat mainHeight;
}

- (id) initWithTitle:(NSString *)title image:(NSImage *)image {
	mainWidth = 250;
	mainHeight = mainWidth * 0.75;
//	mainHeight = (image.size.height < mainHeight) ? image.size.height : mainHeight;

	
	self = [super initWithFrame:NSMakeRect(0, 0, mainWidth, mainHeight)];
    if (self) {
        // Initialization code here.
		
		[self setAutoresizesSubviews:NO];
		[self setAutoresizingMask:0];
		[[self title] setStringValue:title];
		
		NSTextField *textField;
		textField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 17)];
		[textField setStringValue:title];
		[textField setBezeled:NO];
		[textField setDrawsBackground:NO];
		[textField setEditable:NO];
		[textField setSelectable:NO];
		[self addSubview:textField];
		
//		NSRect imageBounds = NSMakeRect(-50, 1, self.bounds.size.width+100, self.bounds.size.height-1);
		
		NSRect imageBounds = NSMakeRect(0, 30, mainWidth, mainHeight);
		imageView = [[NSImageView alloc]initWithFrame:imageBounds];
		[imageView setImageScaling:NSImageScaleProportionallyUpOrDown];
		[[imageView image] setScalesWhenResized:YES];
//		[imageView setBounds:self.bounds];
		[imageView setImage:image];
		
		[self addSubview:imageView];
		
		[self setAcceptsTouchEvents:YES];
		[[self window] makeFirstResponder:self];
		
		// bipanel
		MenuItemBiPanelView *bipanel = [[MenuItemBiPanelView alloc] initWithWidth:mainWidth];
		[self addSubview:bipanel];
		
		active = NO;
    }
    return self;
}

-(BOOL)acceptsFirstResponder{
    return YES;
}

//- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent
//{
//    return YES;
//}

- (void)viewDidMoveToWindow {
	// happens n times
	NSTrackingArea* trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInKeyWindow) owner:self userInfo:nil];
	
    [self addTrackingArea:trackingArea];

    [[self window] becomeKeyWindow];
}

- (void) mouseEntered:(NSEvent *)theEvent{
//	active = YES;
}

- (void) mouseExited:(NSEvent *)theEvent {
//	active = NO;
//	NSLog(@"exit");
//	[self setFrameSize:NSMakeSize(mainWidth, mainHeight)];
//	[imageView setFrameSize:self.frame.size];
//	[self setNeedsDisplay:YES];
}

- (void) mouseDown:(NSEvent *)theEvent {
	active = !active;
	if(active){
		[self expand];
		// [imageView setImage:[self tintImage:[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:0.3]]];
	}else{
		[self collapse];
	}
}

- (NSImage *)tintImage:(NSColor *)tint {
    NSImage *image = [[imageView image] copy];
    if (tint) {
        [image lockFocus];
        [tint set];
        NSRect imageRect = {NSZeroPoint, [image size]};
        NSRectFillUsingOperation(imageRect, NSCompositeSourceAtop);
        [image unlockFocus];
    }
    return image;
}

- (void) expand {
	// [self animateIntoSize: NSMakeSize(mainWidth, mainHeight*3)];
}

- (void) collapse {
	// [self animateIntoSize: NSMakeSize(mainWidth, mainHeight)];
}

- (void) animateIntoSize: (NSSize)size {
	[NSAnimationContext beginGrouping];
	[[NSAnimationContext currentContext] setDuration:0.1f];
	[[self animator] setFrameSize:size];

//	[[imageView animator] setFrameSize:size];

	[NSAnimationContext endGrouping];
	[self setNeedsDisplay:YES];
}


- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
	NSRect bounds = [self bounds];
//    [[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:1] set];
//    [NSBezierPath fillRect:bounds];
	
	[[NSColor colorWithSRGBRed:0 green:0 blue:0 alpha:0.1] set];
	[NSBezierPath strokeRect:bounds];
	
	if (active) {
		[[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:0.3] set];
	}else{
		[[NSColor clearColor]set];
	}
	
	[NSBezierPath fillRect:bounds];
	
    // Drawing code here.
}

@end
