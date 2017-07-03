//
//  RambagramFlowLayout.h
//  BuyTicketsSDK
//
//  Created by i.kvyatkovskiy on 4/17/17.
//  Copyright © 2017 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RambagramFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, assign) NSUInteger numberOfItems;

@property (nonatomic, assign) BOOL ignoreScale;

- (CGFloat)step;

@end
