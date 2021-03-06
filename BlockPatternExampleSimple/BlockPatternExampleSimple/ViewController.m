//
//  ViewController.m
//  BlockPatternExampleSimple
//
//  Created by Kim Hunter on 11/11/12.
//  Copyright (c) 2012 Kim Hunter. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+BlockPattern.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorPatternWithSize:CGSizeMake(40.0, 40.0) andDrawingBlock:[[^(CGRect bnds, CGContextRef c) {

        CGContextSetFillColorWithColor(c, [[UIColor whiteColor] CGColor]);
        CGContextFillRect(c, bnds);
        
        // half the width of the first ellipse, then translate the 2nd over the width of the first
        CGRect firstEllipseRect = CGRectApplyAffineTransform(bnds, CGAffineTransformMakeScale(0.5, 1.0));
        CGRect secndEllipseRect = CGRectApplyAffineTransform(firstEllipseRect, CGAffineTransformMakeTranslation(firstEllipseRect.size.width, 0.0));
        
        CGContextSetFillColorWithColor(c, [[UIColor darkGrayColor] CGColor]);
        CGContextFillEllipseInRect(c, firstEllipseRect);
        
        CGContextSetFillColorWithColor(c, [[UIColor lightGrayColor] CGColor]);
        CGContextFillEllipseInRect(c, secndEllipseRect);
        
    } copy] autorelease]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
