//
// Created by Joshua Sullivan on 4/21/15.
// Copyright (c) 2015 Joshua Sullivan. All rights reserved.
//

@import UIKit;

@interface MinimalistControlView : UIView

@property (strong, nonatomic) NSString *valueName;
@property (assign, nonatomic) CGFloat minValue;
@property (assign, nonatomic) CGFloat maxValue;
@property (assign, nonatomic) CGFloat value;
@property (assign, nonatomic) UIEdgeInsets edgeInsets;

@end