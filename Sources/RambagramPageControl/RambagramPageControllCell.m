//
//  RambagramPageControllCell.m
//  BuyTicketsSDK
//
//  Created by i.kvyatkovskiy on 4/17/17.
//  Copyright © 2017 Rambler&Co. All rights reserved.
//

#import "RambagramPageControllCell.h"

@interface RambagramPageControllCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation RambagramPageControllCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.cornerRadius = self.contentView.bounds.size.width / 2;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.backgroundColor = self.selected ? self.selectedDotColor.CGColor : self.dotColor.CGColor;
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.contentView.layer.backgroundColor = self.selectedDotColor.CGColor;
    } else {
        self.contentView.layer.backgroundColor = self.dotColor.CGColor;
    }
}

@end
