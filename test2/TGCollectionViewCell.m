//
//  TGCollectionViewCell.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "TGCollectionViewCell.h"
#import "TGMessage.h"
#import <Masonry/View+MASAdditions.h>

#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDWebImageDownloader.h"

@implementation TGCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.contentView addSubview:self.imageView1];
    [self.contentView addSubview:self.imageView2];
    [self.contentView addSubview:self.imageView3];
    [self.contentView addSubview:self.imageView4];
    [self.contentView addSubview:self.cellLabel];
}

#pragma mark - Accessors
- (UIImageView *)imageView1
{
    if (!_imageView1)
    {
        _imageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView1.contentMode = UIViewContentModeScaleAspectFit;
        //_imageView.contentMode = UIViewContentModeScaleToFill;
        [[_imageView1 layer] setBorderWidth:2.0f];
        [[_imageView1 layer] setBorderColor:[UIColor greenColor].CGColor];
    }
    return _imageView1;
}

- (UIImageView *)imageView2
{
    if (!_imageView2)
    {
        _imageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView2.contentMode = UIViewContentModeScaleAspectFit;
        //_imageView.contentMode = UIViewContentModeScaleToFill;
        [[_imageView2 layer] setBorderWidth:2.0f];
        [[_imageView2 layer] setBorderColor:[UIColor redColor].CGColor];
    }
    return _imageView2;
}

- (UIImageView *)imageView3
{
    if (!_imageView3)
    {
        _imageView3 = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView3.contentMode = UIViewContentModeScaleAspectFit;
        //_imageView.contentMode = UIViewContentModeScaleToFill;
        [[_imageView3 layer] setBorderWidth:2.0f];
        [[_imageView3 layer] setBorderColor:[UIColor yellowColor].CGColor];
    }
    return _imageView3;
}

- (UIImageView *)imageView4
{
    if (!_imageView4)
    {
        _imageView4 = [[UIImageView alloc] initWithFrame:CGRectZero];
        //_imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageView4.contentMode = UIViewContentModeScaleAspectFit;
        //_imageView.contentMode = UIViewContentModeScaleToFill;
        [[_imageView4 layer] setBorderWidth:2.0f];
        [[_imageView4 layer] setBorderColor:[UIColor blueColor].CGColor];
    }
    return _imageView4;
}

- (UILabel *)cellLabel
{
    if (!_cellLabel) {
        _cellLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _cellLabel.backgroundColor = [UIColor clearColor];
        _cellLabel.textColor = [UIColor blackColor];
        _cellLabel.numberOfLines = 0;
        _cellLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _cellLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.contentView addSubview:self.imageView1];
        [self.contentView addSubview:self.imageView2];
        [self.contentView addSubview:self.imageView3];
        [self.contentView addSubview:self.imageView4];
        [self.contentView addSubview:self.cellLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.message.imageItems.count == 2)
    {
        _imageView1.frame = CGRectMake(0, 0, self.contentView.bounds.size.width/2, 100);
        _imageView2.frame = CGRectMake(self.contentView.bounds.size.width/2, 0, self.contentView.bounds.size.width/2, 100);

        _cellLabel.frame  = CGRectMake(0, 110, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 110);
    } else if (self.message.imageItems.count == 3)
    {
        _imageView1.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 100);
        _imageView2.frame = CGRectMake(0, 100, self.contentView.bounds.size.width/2, 100);
        _imageView3.frame = CGRectMake(self.contentView.bounds.size.width/2, 100, self.contentView.bounds.size.width/2, 100);
        
        _cellLabel.frame  = CGRectMake(0, 210, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 210);
    } else if(self.message.imageItems.count == 4)
    {
        _imageView1.frame = CGRectMake(0, 0, self.contentView.bounds.size.width/2, 100);
        _imageView2.frame = CGRectMake(self.contentView.bounds.size.width/2, 0, self.contentView.bounds.size.width/2, 100);
        _imageView3.frame = CGRectMake(0, 100, self.contentView.bounds.size.width/2, 100);
        _imageView4.frame = CGRectMake(self.contentView.bounds.size.width/2, 100, self.contentView.bounds.size.width/2, 100);
        
        _cellLabel.frame  = CGRectMake(0, 210, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 210);
    } else
    {
        _imageView1.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, 100);
        _cellLabel.frame  = CGRectMake(0, 110, self.contentView.bounds.size.width, self.contentView.bounds.size.height - 110);
    }
}

- (void)reloadAllDataInCell
{
//    if (self.message.imageItems.count == 2)
//    {
//        [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//    } else if (self.message.imageItems.count == 3)
//    {
//        [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//    } else if(self.message.imageItems.count == 4)
//    {
//        [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//        [self.imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//    } else
//    {
//    }
    self.cellLabel.text = self.message.messageString;
    if (self.message.imageItems.count == 2) {
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:0]]];
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:1]]];
    } else if (self.message.imageItems.count == 3)
    {
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:0]]];
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:1]]];
        [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:2]]];
    } else if(self.message.imageItems.count == 4)
    {
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:0]]];
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:1]]];
        [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:2]]];
        [self.imageView4 sd_setImageWithURL:[NSURL URLWithString:[self.message.imageItems objectAtIndex:3]]];
    } else
    {
        NSString *imageUrl = [self.message.imageItems lastObject];
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    }}

@end
