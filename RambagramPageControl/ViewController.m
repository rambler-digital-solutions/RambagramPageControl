//
//  ViewController.m
//  RambagramPageControl
//
//  Created by i.kvyatkovskiy on 7/3/17.
//  Copyright © 2017 i.kvyatkovskiy. All rights reserved.
//

#import "ViewController.h"
#import "RambagramPageControl.h"
#import "ImageCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageControl.numberOfPages = [self collectionView:self.collectionView
                                   numberOfItemsInSection:0];
    self.pageControl.currentPage = 0;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = self.collectionView.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCell"
                                                                              forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:[self imageNames][indexPath.row]];
    cell.imageView.image = image;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self imageNames] count];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint center = CGPointMake(scrollView.frame.size.width / 2 + scrollView.contentOffset.x,
                                 scrollView.frame.size.height / 2 + scrollView.contentOffset.y);
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:center];
    if (indexPath) {
        self.pageControl.currentPage = indexPath.row;
    }
}

- (NSArray *)imageNames {
    return @[@"v", @"i", @"p", @"e", @"r", @"f", @"t", @"w"];
}

@end
