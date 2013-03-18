//
//  SASliderRight.m
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2013 Andrei Solovjev - http://solovjev.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SASliderRight.h"

@implementation SASliderRight

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0.992 green: 0.902 blue: 0.004 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 1 green: 0.343 blue: 0.343 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 1 green: 0.41 blue: 0.114 alpha: 1];
    UIColor* color9 = [UIColor colorWithRed: 1 green: 0.114 blue: 0.114 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradient3Colors = [NSArray arrayWithObjects:
                                (id)gradientColor2.CGColor,
                                (id)[UIColor colorWithRed: 0.996 green: 0.951 blue: 0.502 alpha: 1].CGColor,
                                (id)color5.CGColor, nil];
    CGFloat gradient3Locations[] = {0, 0, 0.49};
    CGGradientRef gradient3 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient3Colors, gradient3Locations);
    
    //// Frames
    CGRect bubbleFrame = self.bounds;
    
    
    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(bubbleFrame), CGRectGetMinY(bubbleFrame), CGRectGetWidth(bubbleFrame), CGRectGetHeight(bubbleFrame));
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii: CGSizeMake(5, 5)];
    [roundedRectanglePath closePath];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient3,
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMinY(roundedRectangleRect)),
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMaxY(roundedRectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [[UIColor clearColor] setStroke];
    roundedRectanglePath.lineWidth = 0.5;
    [roundedRectanglePath stroke];
    
    
    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.50862 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.16346 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68192 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.32674 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.97595 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.38272 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.78902 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.53960 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.79745 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.73748 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.50862 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.67115 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.21980 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.73748 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.22822 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.53960 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.04129 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.38272 * CGRectGetHeight(bubbleFrame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.33533 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.32674 * CGRectGetHeight(bubbleFrame))];
    [starPath closePath];
    [color8 setFill];
    [starPath fill];
    [gradientColor setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [gradientColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(bubbleFrame) + floor((CGRectGetWidth(bubbleFrame) - 5) * 0.31250) + 0.5, CGRectGetMinY(bubbleFrame) + floor((CGRectGetHeight(bubbleFrame) - 5) * 0.41489) + 0.5, 5, 5)];
    [color7 setFill];
    [ovalPath fill];
    [gradientColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
    
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(bubbleFrame) + floor((CGRectGetWidth(bubbleFrame) - 5) * 0.64583) + 0.5, CGRectGetMinY(bubbleFrame) + floor((CGRectGetHeight(bubbleFrame) - 5) * 0.41489) + 0.5, 5, 5)];
    [color7 setFill];
    [oval2Path fill];
    [gradientColor setStroke];
    oval2Path.lineWidth = 1;
    [oval2Path stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.29310 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.54808 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.70690 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.54808 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.50000 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.66346 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.70690 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.54808 * CGRectGetHeight(bubbleFrame))];
    [gradientColor setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(bubbleFrame) + 0.5, CGRectGetMinY(bubbleFrame) + 0.5, 1, floor((CGRectGetHeight(bubbleFrame) - 0.5) * 0.76699 + 0.5))];
    [color9 setFill];
    [rectanglePath fill];
    [color9 setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient3);
    CGColorSpaceRelease(colorSpace);
    

    
    
}


@end
