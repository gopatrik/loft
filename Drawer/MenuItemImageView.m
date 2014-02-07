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
	MenuItemBiPanelView *biPanel;
	BOOL debug;
}

- (id) initWithTitle:(NSString *)title image:(NSImage *)image {
	debug = YES;
	CGFloat mainWidth = 250;
	NSRect originalFrame = NSMakeRect(0, 0, mainWidth, mainWidth*0.75);
	
	self = [super initWithFrame:originalFrame];
    if (self) {
        // Initialization code here.
		
		[self setAutoresizesSubviews:NO];
		[self setAutoresizingMask:0];
		
		// [[self title] setStringValue:title];
		
		[self setUpTitleTextViewWithText:title];
		[self setUpImageViewWith:image];
		
		[self setAcceptsTouchEvents:YES];
		[[self window] makeFirstResponder:self];
		
		// biPanel
		biPanel = [[MenuItemBiPanelView alloc] initWithWidth:mainWidth];
		[self addSubview:biPanel];
//		[self collapse];
		
		active = NO;
    }
    return self;
}

-(BOOL)acceptsFirstResponder{
    return YES;
}

- (void) setUpTitleTextViewWithText:(NSString*)title{
	NSTextField *textField;
	textField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 200, 17)];
	[textField setStringValue:title];
	[textField setBezeled:NO];
	[textField setDrawsBackground:NO];
	[textField setEditable:NO];
	[textField setSelectable:NO];
	[self addSubview:textField];
}

- (void) setUpImageViewWith:(NSImage*)image{
	
	NSRect imageBounds;
	CGFloat scale = self.bounds.size.width / image.size.width;
	imageBounds = NSMakeRect(0, 0, image.size.width * scale, image.size.height * scale);
	
	
	imageView = [[NSImageView alloc]initWithFrame:imageBounds];
//	[imageView setFrameOrigin:NSMakePoint(imageView.frame.origin.x, imageView.frame.origin.y+10)];
	[imageView setImageScaling:NSImageScaleProportionallyUpOrDown];
	[[imageView image] setScalesWhenResized:YES];
	//		[imageView setBounds:self.bounds];
	[imageView setImage:image];
	
	[self setFrame:imageBounds];
	
	[self addSubview:imageView];
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
	[biPanel setState:active];
	if(active){
		//[self expand];
		// [imageView setImage:[self tintImage:[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:0.3]]];
	}else{
		//[self collapse];
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


- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
	NSRect bounds = [self bounds];
//    [[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:1] set];
//    [NSBezierPath fillRect:bounds];
	
	[[NSColor colorWithSRGBRed:0 green:0 blue:0 alpha:0.1] set];
	[NSBezierPath strokeRect:bounds];
	
	
	if(debug){
		[[NSColor blackColor] set];
		//[NSBezierPath strokeRect:bounds];
		[NSBezierPath fillRect:imageView.frame];
	}
	
	if (active) {
	//	[[NSColor colorWithSRGBRed:0.8 green:0.5 blue:0.5 alpha:0.3] set];
	}else{
		//[[NSColor clearColor]set];
	}
	[[NSColor clearColor]set];
	[NSBezierPath fillRect:bounds];
	
    // Drawing code here.
}

@end
