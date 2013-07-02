//
//  STCollectionViewCell.h
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STModelObject;

@interface STCollectionViewCell : UICollectionViewCell

-(void) populateCell: (STModelObject*) model;

@end
