//
//  ViewController.m
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDWebImageDownloader.h"
#import "TGMessage.h"
#import "TGCollectionViewLayout.h"
#import "UIApplication+TGAppDimensions.h"

#import "TGCollectionViewCell.h"
#import "TGCollectionViewCell2.h"
#import "TGCollectionViewCell3.h"
#import "TGCollectionViewCell4.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, assign) CGSize currentCellSize;
@end

@implementation ViewController

- (NSMutableArray *)images
{
    if (!_images)
    {
        _images = [NSMutableArray new];
    }
    return _images;
}

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [NSMutableArray new];
    }
    return _items;
}

#pragma mark - ViewController lyfecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [SDWebImageDownloader sharedDownloader].maxConcurrentDownloads = 10;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [self.flowLayout setItemSize:CGSizeMake(200, 200)];
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:self.flowLayout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGSize tmpSize = self.collectionView.bounds.size;
    self.currentCellSize = CGSizeMake((tmpSize.width), (tmpSize.height));
    [self generateDifferenImages];
    [self generateRandomCellItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//}
//
//- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    CGSize tmpSize = self.collectionView.bounds.size;
//    self.currentCellSize = CGSizeMake((tmpSize.width), (tmpSize.height));
//    [self.collectionView performBatchUpdates:nil completion:nil];
//    //[self.collectionView.collectionViewLayout invalidateLayout];
//}

#pragma mark - Private methods
+ (CGFloat)heightForText:(NSString*)text
                    font:(UIFont*)font
             withinWidth:(CGFloat)width
{
    CGSize constraint = CGSizeMake(width, 20000.0f);
    CGSize size;
    CGSize boundingBox = [text boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:font}
                                            context:nil].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return size.height;
}


- (void)generateDifferenImages
{
    for (NSUInteger index = 0; index < 300; index ++)
    {
        [self.images addObject:[NSString stringWithFormat:@"https://placeimg.com/480/320/people/%@",@(index)]];
    }
}

- (void)generateRandomCellItems
{
    __block NSMutableArray *allItems = [NSMutableArray new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSUInteger index = 0; index < 400; index ++)
        {
            TGMessage *message = [TGMessage new];
            NSInteger randomInteger = arc4random() % 4 + 1;
            
            NSMutableArray *images = [NSMutableArray new];
            for (NSUInteger index = 0; index < randomInteger; index ++) {
                [images addObject:[self.images objectAtIndex:(arc4random()%298 + 1)]];
            }
            message.imageItems = [[NSArray alloc] initWithArray:images];
            
            NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789 ";
            NSMutableString *s = [NSMutableString stringWithCapacity:20];
            for (NSUInteger i = 0; i < 500; i++) {
                u_int32_t r = arc4random() % [alphabet length];
                unichar c = [alphabet characterAtIndex:r];
                [s appendFormat:@"%C", c];
            }
            message.messageString = [[NSString alloc] initWithString:s];
            [allItems addObject:message];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.items addObjectsFromArray:allItems];
            [self.collectionView reloadData];
        });
    });
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TGMessage *message = [self.items objectAtIndex:indexPath.row];
    if (message.imageItems.count == 2) {
        TGCollectionViewCell2 *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell2"
                                                                               forIndexPath:indexPath];
        [cell2.imageView1 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:0]]];
        [cell2.imageView2 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:1]]];
        cell2.cellLabel.text = message.messageString;
        return cell2;
    } else if (message.imageItems.count == 3)
    {
        TGCollectionViewCell3 *cell3 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell3"
                                                                               forIndexPath:indexPath];
        [cell3.imageView1 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:0]]];
        [cell3.imageView2 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:1]]];
        [cell3.imageView3 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:2]]];
        cell3.cellLabel.text = message.messageString;
        return cell3;
    } else if(message.imageItems.count == 4)
    {
        TGCollectionViewCell4 *cell4 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell4"
                                                                                 forIndexPath:indexPath];
        [cell4.imageView1 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:0]]];
        [cell4.imageView2 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:1]]];
        [cell4.imageView3 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:2]]];
        [cell4.imageView4 sd_setImageWithURL:[NSURL URLWithString:[message.imageItems objectAtIndex:3]]];
        cell4.cellLabel.text = message.messageString;
        return cell4;
    } else
    {
        TGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell"
                                                                               forIndexPath:indexPath];
        NSString *imageUrl = [message.imageItems lastObject];
        [cell.image sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        cell.label.text = message.messageString;
        return cell;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TGMessage *message = [self.items objectAtIndex:indexPath.item];
    CGFloat height = [ViewController heightForText:message.messageString
                                              font:[UIFont systemFontOfSize:17]
                                       withinWidth:(320 - 2*10)];
    
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
    {
        NSLog(@"UIDeviceOrientationLandscapeLeft");
    }
    NSLog(@"UIDeviceOrientationPortrait");
    
    
    if (message.imageItems.count > 2)
    {
        return CGSizeMake(self.currentCellSize.width - 2 * 10, height + 120);
    }else
    {
        return CGSizeMake(self.currentCellSize.width - 2 * 10, height);
    }
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 5;
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    
//}
@end
