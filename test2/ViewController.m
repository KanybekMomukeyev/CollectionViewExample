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

#import "TGCollectionViewCell.h"
#import "TGCollectionViewCell2.h"
#import "TGCollectionViewCell3.h"
#import "TGCollectionViewCell4.h"

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation ViewController

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
    [self generateRandomCellItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //[self.collectionView performBatchUpdates:nil completion:nil];
    [self.collectionView.collectionViewLayout invalidateLayout];
}

#pragma mark - Private methods
- (void)generateRandomCellItems
{
    __block NSMutableArray *allItems = [NSMutableArray new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSUInteger index = 0; index < 300; index ++)
        {
            TGMessage *message = [TGMessage new];
            NSInteger randomInteger = arc4random() % 4 + 1;
            
            NSMutableArray *images = [NSMutableArray new];
            for (NSUInteger index = 0; index < randomInteger; index ++) {
                [images addObject:[NSString stringWithFormat:@"http://placehold.it/400x400&text=image%@",@(index)]];
            }
            message.imageItems = [[NSArray alloc] initWithArray:images];
            
            NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
            NSMutableString *s = [NSMutableString stringWithCapacity:20];
            for (NSUInteger i = 0; i < 300; i++) {
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *glCell = nil;
    switch (arc4random() % 1) {
        case 0:{
            TGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell"
                                                             forIndexPath:indexPath];
            TGMessage *message = [self.items objectAtIndex:indexPath.row];
            NSString *imageUrl = [message.imageItems lastObject];
            [cell.image sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                          placeholderImage:[UIImage imageNamed:@"placeholder"] options:indexPath.row == 0 ? SDWebImageRefreshCached : 0];
            cell.label.text = message.messageString;
            glCell = cell;
            break;
        }
        case 1:{
            TGCollectionViewCell2 *cell2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell2"
                                                                                    forIndexPath:indexPath];
            glCell = cell2;
            break;
        }
        case 2:{
            TGCollectionViewCell3 *cell3 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell3"
                                                             forIndexPath:indexPath];
            glCell = cell3;
            break;
        }
        case 3:{
            TGCollectionViewCell3 *cell4 = [collectionView dequeueReusableCellWithReuseIdentifier:@"TGCollectionViewCell4"
                                                             forIndexPath:indexPath];
            glCell = cell4;
            break;
        }
        default:
            break;
    }
    return glCell;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TGMessage *message = [self.items objectAtIndex:indexPath.item];
    return CGSizeMake(SCREEN_WIDTH - 2*10, 166.f);
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
