//
//  TGCollectionViewCell.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewCell.h"

@implementation TGCollectionViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.image.frame = self.contentView.frame;
    self.label.frame = self.contentView.frame;
}

@end
