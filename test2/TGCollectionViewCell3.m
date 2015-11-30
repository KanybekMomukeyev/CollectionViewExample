//
//  TGCollectionViewCell3.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewCell3.h"

@implementation TGCollectionViewCell3

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.cellLabel.numberOfLines = 0;
    self.cellLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [[self.imageView1 layer] setBorderWidth:2.0f];
    [[self.imageView1 layer] setBorderColor:[UIColor yellowColor].CGColor];
    [[self.imageView2 layer] setBorderWidth:2.0f];
    [[self.imageView2 layer] setBorderColor:[UIColor blueColor].CGColor];
    [[self.imageView3 layer] setBorderWidth:2.0f];
    [[self.imageView3 layer] setBorderColor:[UIColor grayColor].CGColor];
}

@end
