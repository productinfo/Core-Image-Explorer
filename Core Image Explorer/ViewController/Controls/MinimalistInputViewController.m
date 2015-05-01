//
//  MinimalistInputViewController.m
//  Core Image Explorer
//
//  Created by Joshua Sullivan on 4/21/15.
//  Copyright (c) 2015 Joshua Sullivan. All rights reserved.
//

#import "MinimalistInputViewController.h"
#import "MinimalistControlView.h"
#import "MinimalistInputDescriptor.h"

@interface MinimalistInputViewController ()

@property (assign, nonatomic) NSUInteger inputCount;
@property (strong, nonatomic) NSArray *inputDescriptors;
@property (strong, nonatomic) NSArray *sectionDividers;

@property (strong, nonatomic) NSArray *inputControls;

@end

@implementation MinimalistInputViewController

+ (MinimalistInputViewController *)minimalistControlForInputCount:(NSUInteger)inputCount inputDescriptors:(NSArray *)descriptors
{
    return [[self alloc] initWithInputCount:inputCount inputDescriptors:descriptors];
}

- (instancetype)initWithInputCount:(NSUInteger)inputCount inputDescriptors:(NSArray *)descriptors
{
    NSAssert(inputCount > 0, @"WARNING: You must specify at least 1 input. Value of 1 will be used for inputCount.");
    if (inputCount > descriptors.count) {
        NSAssert(NO, @"ERROR: You must provide enough descriptors to cover all inputs.");
        return nil;
    }
    self = [super initWithNibName:nil bundle:nil];
    if (!self) {
        NSLog(@"ERROR: Unable to create MinimalistInputViewController.");
        return nil;
    }
    _inputCount = MAX(1, inputCount);
    _inputDescriptors = descriptors;
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    return self;
}

- (void)loadView
{
    // Base view is just a generic UIView.
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:screenBounds];
    self.view = view;

    // Create the input subviews.
    NSMutableArray *inputs = [NSMutableArray arrayWithCapacity:self.inputCount];
    for (NSInteger i = 0; i < self.inputCount; i++) {
        MinimalistInputDescriptor *descriptor = self.inputDescriptors[i];
        MinimalistControlView *inputControl = [[MinimalistControlView alloc] initWithDescriptor:descriptor];
        [inputs addObject:inputControl];
        [self.view addSubview:inputControl];
    }
    self.inputControls = [NSArray arrayWithArray:inputs];
    [self updateControlFramesForBounds:screenBounds];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.tintColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateControlFramesForBounds:(CGRect)bounds
{

    BOOL isHorizontal = bounds.size.width > bounds.size.height;
    CGFloat dx = 0.0f;
    CGFloat dy = 0.0f;
    CGFloat w = bounds.size.width;
    CGFloat h = bounds.size.height;
    if (isHorizontal) {
        w = bounds.size.width / self.inputCount;
        dx = w;
    } else {
        h = bounds.size.height / self.inputCount;
        dy = h;
    }
    for (NSUInteger i = 0; i < self.inputCount; i++) {
        UIView *input = self.inputControls[i];
        CGRect inputFrame = CGRectIntegral(CGRectMake(dx * i, dy * i, w, h));
        input.frame = inputFrame;
    }
}

#pragma mark - Getters & Setters

- (void)setDescriptor:(MinimalistInputDescriptor *)descriptor forInputIndex:(NSUInteger)index
{

}

- (CGFloat)valueForInputIndex:(NSUInteger)index
{
    return 0;
}

@end
