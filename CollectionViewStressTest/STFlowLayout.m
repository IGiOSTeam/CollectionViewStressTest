//
//  STFlowLayout.m
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import "STFlowLayout.h"

@implementation STFlowLayout

-(void) prepareForCollectionViewUpdates:(NSArray *)updateItems {
// TODO: remove this hack
    @try {
        [super prepareForCollectionViewUpdates:updateItems];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
}
@end
