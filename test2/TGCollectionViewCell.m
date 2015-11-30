//
//  TGCollectionViewCell.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewCell.h"

@implementation TGCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByWordWrapping;
    [[self.image layer] setBorderWidth:2.0f];
    [[self.image layer] setBorderColor:[UIColor greenColor].CGColor];
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.image.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 100);
//    self.label.frame = CGRectMake(0, 100, self.contentView.bounds.size.width, self.label.frame.size.height);
//}

@end
