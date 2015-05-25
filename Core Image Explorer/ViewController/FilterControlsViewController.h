//
// Created by Joshua Sullivan on 4/5/15.
// Copyright (c) 2015 Joshua Sullivan. All rights reserved.
//

@import UIKit;

@class CIFilter;
@protocol FilterControlsDelegate;

@interface FilterControlsViewController : UINavigationController

@property (weak, nonatomic) id <FilterControlsDelegate> filterControlsDelegate;

- (instancetype)initWithFilter:(CIFilter *)filter;

- (CGFloat)contentHeight;

@end

@protocol FilterControlsDelegate <NSObject>

- (void)filterControlsViewController:(FilterControlsViewController *)filterControlsViewController didSetValue:(id)value forAttribute:(NSString *)attribute onFilter:(CIFilter *)filter;

- (void)filterControlsViewController:(FilterControlsViewController *)filterControlsViewController
                didRequestFullScreen:(BOOL)fullScreen;

@end
