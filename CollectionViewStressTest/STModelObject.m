//
//  STModelObject.m
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import "STModelObject.h"

@implementation STModelObject

+(STModelObject*) newObject {
    STModelObject *newObject = [[STModelObject alloc] init];
    newObject.image = [STModelObject randomImage];
    return newObject;
}

+(UIImage*) randomImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    
    UIBezierPath *rect = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor colorWithWhite:0.3 alpha:1.0] set];
    [rect fill];
    
    [[UIColor whiteColor] set];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    for (int i = 0;i<10;i++) {
        CGFloat x = rand()%100;
        CGFloat y = rand()%100;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    [path stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
@end
