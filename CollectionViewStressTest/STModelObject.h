//
//  STModelObject.h
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STModelObject : NSObject
@property (strong) UIImage *image;

+(STModelObject*) newObject;

@end
