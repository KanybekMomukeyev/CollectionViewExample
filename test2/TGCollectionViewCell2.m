//
//  TGCollectionViewCell2.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewCell2.h"

@implementation TGCollectionViewCell2

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.cellLabel.numberOfLines = 0;
    self.cellLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [[self.imageView1 layer] setBorderWidth:2.0f];
    [[self.imageView1 layer] setBorderColor:[UIColor yellowColor].CGColor];
    [[self.imageView2 layer] setBorderWidth:2.0f];
    [[self.imageView2 layer] setBorderColor:[UIColor redColor].CGColor];
}

@end
