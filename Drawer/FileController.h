//
//  FileController.h
//  Loft
//
//  Created by Patrik Göthe on 01/02/14.
//  Copyright (c) 2014 Patrik Göthe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuFile.h"
#import <ArchDirectoryObserver/ArchDirectoryObserver.h>

@interface FileController : NSFileManager
- (NSMenu*) getDesktopAsMenu;
@end
