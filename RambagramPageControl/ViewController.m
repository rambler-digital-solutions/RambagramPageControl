// Copyright (c) 2017 RAMBLER&Co
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
