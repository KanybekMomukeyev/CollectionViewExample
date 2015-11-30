//
//  TGCollectionViewLayout.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewLayout.h"

@implementation TGCollectionViewLayout

- (void)prepareLayout
{
    NSInteger section = 0;
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
    for (NSInteger item = 0; item < itemCount; item ++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
        UICollectionViewLayoutAttributes *itemAttributes =
        [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        itemAttributes.frame = [self frameForAlbumPhotoAtIndexPath:indexPath];
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return nil;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

#pragma mark - private 
- (CGRect)frameForAlbumPhotoAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectMake(0, 0, 300, 300);
}

@end
