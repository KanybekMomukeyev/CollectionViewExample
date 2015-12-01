//
//  TGCollectionViewCell.h
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TGMessage;
@interface TGCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView4;
@property (nonatomic, strong) UILabel *cellLabel;
@property (nonatomic, strong) TGMessage *message;
- (void)reloadAllDataInCell;
@end
