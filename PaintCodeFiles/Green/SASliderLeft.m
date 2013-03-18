//
//  SASliderLeft.m
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

#import "SASliderLeft.h"

@implementation SASliderLeft

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
    UIColor* gradientColor = [UIColor colorWithRed: 0.449 green: 0.758 blue: 0.489 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.196 green: 0.161 blue: 0.047 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientPurpleColors = [NSArray arrayWithObjects:
                                     (id)gradientColor2.CGColor,
                                     (id)[UIColor colorWithRed: 0.725 green: 0.879 blue: 0.745 alpha: 1].CGColor,
                                     (id)gradientColor.CGColor, nil];
    CGFloat gradientPurpleLocations[] = {0, 0, 1};
    CGGradientRef gradientPurple = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientPurpleColors, gradientPurpleLocations);
    
    //// Frames
    CGRect bubbleFrame = self.bounds;
    
    
    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(bubbleFrame), CGRectGetMinY(bubbleFrame), CGRectGetWidth(bubbleFrame), CGRectGetHeight(bubbleFrame));
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake(5, 5)];
    [roundedRectanglePath closePath];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradientPurple,
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMinY(roundedRectangleRect)),
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMaxY(roundedRectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [[UIColor clearColor] setStroke];
    roundedRectanglePath.lineWidth = 0.5;
    [roundedRectanglePath stroke];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.42806 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.42806 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.74629 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.42806 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.42806 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.35577 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.74629 * CGRectGetHeight(bubbleFrame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.35577 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.35577 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.35577 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.42806 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 19;
    
    [color6 setFill];
    [bezier3Path fill];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.66944 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.66944 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.74629 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.66944 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.66944 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.74629 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.69415 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.66944 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezierPath closePath];
    bezierPath.miterLimit = 19;
    
    [color6 setFill];
    [bezierPath fill];
    
    
    //// Cleanup
    CGGradientRelease(gradientPurple);
    CGColorSpaceRelease(colorSpace);
    

    

}


@end
