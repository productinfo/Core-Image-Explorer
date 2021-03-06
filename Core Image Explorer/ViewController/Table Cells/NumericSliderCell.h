//
//  NumericSliderCell.h
//  Core Image Explorer
//
//  Created by Joshua Sullivan on 10/16/12.
//  Copyright (c) 2012 Joshua Sullivan. All rights reserved.
//

#import "BaseInputControlCell.h"

@interface NumericSliderCell : BaseInputControlCell

- (void)setInputRangeMinValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue andDefaultValue:(NSNumber *)defaultValue;

@end
