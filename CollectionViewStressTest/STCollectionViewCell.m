//
//  STCollectionViewCell.m
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import "STCollectionViewCell.h"
#import "STModelObject.h"

@implementation STCollectionViewCell {
    UIImageView *_imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}

-(void) populateCell: (STModelObject*) model {
    _imageView.image = model.image;
}

@end
