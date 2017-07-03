//
//  RambagramFlowLayout.m
//  BuyTicketsSDK
//
//  Created by i.kvyatkovskiy on 4/17/17.
//  Copyright © 2017 Rambler&Co. All rights reserved.
//

#import "RambagramFlowLayout.h"

@implementation RambagramFlowLayout

- (CGFloat)step {
    return self.itemSize.width + self.minimumLineSpacing;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray<UICollectionViewLayoutAttributes *> *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
    if (self.ignoreScale) {
        return layoutAttributes;
    }

    NSMutableArray *transformedAttributesArray = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        UICollectionViewLayoutAttributes *transformedAttributes = [self transformedAttributes:attributes];
        [transformedAttributesArray addObject:transformedAttributes];
    }

    return transformedAttributesArray;
}

- (CGSize)collectionViewContentSize {
    CGFloat offset = 2 * [self step];
    
    NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat contentWidth = offset + numberOfItems * [self step] + offset;
    CGFloat contentHeight = self.itemSize.height;
    return CGSizeMake(contentWidth,
                      contentHeight);
}

- (UICollectionViewLayoutAttributes *)transformedAttributes:(UICollectionViewLayoutAttributes *)attributes {
    
    attributes = [attributes copy];
    
    CGFloat offset = 2 * [self step] + self.itemSize.width / 2;
    CGFloat contentOffset = self.collectionView.contentOffset.x;
    CGFloat normalizedCenter = attributes.center.x - contentOffset;
    
    CGFloat scale = 1;
    CGFloat shift = offset + 2.0 * [self step];

    if (normalizedCenter < offset) {
        // increasing
        scale = normalizedCenter / offset;
    } else if (normalizedCenter < shift) {
        // plateu
        scale = 1.0;
    } else {
        // decreasing
        CGFloat diff = normalizedCenter - shift;
        scale = fabs(1 - diff / offset);
    }
    
    scale = MAX(scale, 0.35);

    scale = MIN(scale * 1.2, 1.0);

    attributes.transform3D = CATransform3DScale(CATransform3DIdentity,
                                                scale,
                                                scale,
                                                1);
    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat proposedContentOffsetCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5f;
    
    CGRect proposedRect = self.collectionView.bounds;
    
    NSArray *layoutAttributes = [self layoutAttributesForElementsInRect:proposedRect];
    
    UICollectionViewLayoutAttributes* itemToScroll;
    for (UICollectionViewLayoutAttributes* attributes in layoutAttributes) {
        if(!itemToScroll) {
            itemToScroll = attributes;
            continue;
        }
        BOOL isCloserToCenter = fabs(attributes.center.x - proposedContentOffsetCenterX) < fabs(itemToScroll.center.x - proposedContentOffsetCenterX);
        if (isCloserToCenter) {
            itemToScroll = attributes;
        }
    }

    CGPoint targetContentOffset = CGPointMake(itemToScroll.center.x - self.collectionView.bounds.size.width * 0.5f,
                                              proposedContentOffset.y);
    //
    targetContentOffset.x = floor(targetContentOffset.x);
    targetContentOffset.y = floor(targetContentOffset.y);
    return targetContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
