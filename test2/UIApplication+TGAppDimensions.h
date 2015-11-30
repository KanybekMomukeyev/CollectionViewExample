//
//  UIApplication+TGAppDimensions.h
//  test2
//
//  Created by kanybek on 11/30/15.
//  Copyright © 2015 kanybek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (TGAppDimensions)
+ (CGSize) currentSize;
+ (CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation;
@end
