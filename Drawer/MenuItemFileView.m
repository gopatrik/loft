//
//  MenuItemFileView.m
//  Loft
//
//  Created by Patrik Göthe on 04/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import "MenuItemFileView.h"

@implementation MenuItemFileView {
	NSTextField *textField;
}

- (id)initWithTitle:(NSString*)title {
	CGFloat mainWidth = 250;
	CGFloat mainHeight = 70;
	NSLog(@"%@", title);
    self = [super initWithFrame:NSMakeRect(0, 0, mainWidth, mainHeight)];
    if (self) {
        textField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, mainWidth, 40)];
		[textField setBezeled:NO];
		[textField setDrawsBackground:NO];
		[textField setEditable:NO];
		[textField setSelectable:NO];
		[textField setStringValue:title];
		[self addSubview:textField];
    }
    return self;
}

- (NSColor *) colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [NSColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	

	[[self colorFromHexString:@"#88eedd"] set];
	[NSBezierPath fillRect:self.bounds];
	
	[[NSColor whiteColor]set];
	
	[NSBezierPath strokeRect:self.bounds];
	
    // Drawing code here.
}

@end