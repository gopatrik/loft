//
//  MenuItemBiPanelView.h
//  Loft
//
//  Created by Patrik Göthe on 03/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MenuItemBiPanelView : NSView
- (id) initWithWidth:(CGFloat)width;
- (void) setState:(BOOL)active;
@end
