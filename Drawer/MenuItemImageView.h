//
//  MenuItemView.h
//  Loft
//
//  Created by Patrik Göthe on 02/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MenuItemImageView : NSView
@property NSTextField *title;

- (id) initWithTitle:(NSString*)title image:(NSImage*)image;
@end
