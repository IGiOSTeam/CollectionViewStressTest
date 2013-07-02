//
//  STViewController.m
//  CollectionViewStressTest
//
//  Created by Daniel Broad on 02/07/2013.
//  Copyright (c) 2013 Daniel Broad. All rights reserved.
//

#import "STViewController.h"
#import "STModelObject.h"
#import "STCollectionViewCell.h"
#import "STFlowLayout.h"

@interface STViewController ()

@end

@implementation STViewController {
    NSMutableArray *_array;
    NSTimer *_timer;
}

- (id) init {
    UICollectionViewFlowLayout *layout = [[STFlowLayout alloc] init];
    [layout setHeaderReferenceSize:CGSizeMake(320, 5)];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _array = [NSMutableArray array];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:STCollectionViewCell.class forCellWithReuseIdentifier:@"Cell"];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [[UICollectionReusableView alloc] init];
    view.backgroundColor = [UIColor redColor];
    return view;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_array count];
}

-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell populateCell:[_array objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - timer

-(void) timer: (NSTimer*) timer {
    NSInteger task = rand()%3;
    
    NSInteger position = 0;
    NSInteger newposition = 0;
    if (_array.count) {
        position = rand()%_array.count;
        newposition = rand()%_array.count;
    }
    
    switch (task) {
        case 0: // insert
            [_array insertObject:[STModelObject newObject] atIndex:position];
            [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:position inSection:0]]];
            break;
        case 1: // delete
            if ([_array count]) {
                [_array removeObjectAtIndex:position];
                [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:position inSection:0]]];
            }
            break;
        case 2: // move
            if ([_array count] && position != newposition) {
                id temp = [_array objectAtIndex: position];
                [_array removeObjectAtIndex:position];
                [_array insertObject:temp atIndex: newposition];
                [self.collectionView moveItemAtIndexPath:[NSIndexPath indexPathForItem:position inSection:0] toIndexPath:[NSIndexPath indexPathForItem:newposition inSection:0]];
            }
            break;
        default:
            break;
    }
}

@end
