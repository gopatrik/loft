//
//  Bar.h
//  Loft
//
//  Created by Patrik Göthe on 02/11/13.
//  Copyright (c) 2013 Patrik Göthe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject
    @property NSStatusItem *barMenu;
    @property NSImage *icon;
    @property NSImage *alternateIcon;

- (id)initWithMenu:(NSMenu*)menu;
@end
