//
//  ViewController.h
//  RambagramPageControl
//
//  Created by i.kvyatkovskiy on 7/3/17.
//  Copyright © 2017 i.kvyatkovskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RambagramPageControl;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet RambagramPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

