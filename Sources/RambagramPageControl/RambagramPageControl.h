//
//  RambagramPageControl.h
//  BuyTicketsSDK
//
//  Created by i.kvyatkovskiy on 4/14/17.
//  Copyright © 2017 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 @author Ivan Kvyatkovskiy
 
 PageControl ala Instagram
 */
@interface RambagramPageControl : UIView

@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, assign) NSUInteger numberOfPages;

/**
 @author Ivan Kvyatkovskiy
 
 Page dot size
 */
@property (nonatomic, assign) IBInspectable CGSize dotSize;

/**
 @author Ivan Kvyatkovskiy
 
 Dot color
 */
@property (nonatomic, strong) IBInspectable UIColor *dotColor;

/**
 @author Ivan Kvyatkovskiy

 Selected dot color
 */
@property (nonatomic, strong) IBInspectable UIColor *selectedDotColor;

/**
 @author Ivan Kvyatkovskiy
 
 Spacing between dots
 */
@property (nonatomic, assign) IBInspectable CGFloat spacing;

@end
