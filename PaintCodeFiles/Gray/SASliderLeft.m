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
    UIColor* fillColor = [UIColor colorWithRed: 0.945 green: 0.945 blue: 0.945 alpha: 1];
    UIColor* strokeColor2 = [UIColor colorWithRed: 0.419 green: 0.417 blue: 0.417 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.835 green: 0.835 blue: 0.857 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)fillColor.CGColor,
                               (id)[UIColor colorWithRed: 0.806 green: 0.806 blue: 0.806 alpha: 1].CGColor,
                               (id)color3.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)color4.CGColor,
                                (id)[UIColor colorWithRed: 0.627 green: 0.626 blue: 0.637 alpha: 1].CGColor,
                                (id)strokeColor2.CGColor,
                                (id)[UIColor colorWithRed: 0.419 green: 0.417 blue: 0.417 alpha: 1].CGColor,
                                (id)strokeColor2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 0, 0.74, 0.92, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Frames
    CGRect bubbleFrame = self.bounds;
    
    
    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(bubbleFrame), CGRectGetMinY(bubbleFrame), CGRectGetWidth(bubbleFrame), CGRectGetHeight(bubbleFrame));
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake(5, 5)];
    [roundedRectanglePath closePath];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMinY(roundedRectangleRect)),
                                CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMaxY(roundedRectangleRect)),
                                0);
    CGContextRestoreGState(context);
    [[UIColor clearColor] setStroke];
    roundedRectanglePath.lineWidth = 0.5;
    [roundedRectanglePath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68668 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68668 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.76552 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68668 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68668 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.76552 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.59715 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.68668 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 19;
    
    CGContextSaveGState(context);
    [bezier2Path addClip];
    CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
    CGContextDrawLinearGradient(context, gradient2,
                                CGPointMake(CGRectGetMinX(bezier2Bounds), CGRectGetMidY(bezier2Bounds)),
                                CGPointMake(CGRectGetMaxX(bezier2Bounds), CGRectGetMidY(bezier2Bounds)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.47978 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.47978 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.76552 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.47978 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.47978 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.39025 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.76552 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.39025 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame)) controlPoint1: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.39025 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame)) controlPoint2: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.39025 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.71146 * CGRectGetHeight(bubbleFrame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(bubbleFrame) + 0.47978 * CGRectGetWidth(bubbleFrame), CGRectGetMinY(bubbleFrame) + 0.22486 * CGRectGetHeight(bubbleFrame))];
    [bezierPath closePath];
    bezierPath.miterLimit = 19;
    
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
    CGContextDrawLinearGradient(context, gradient2,
                                CGPointMake(CGRectGetMinX(bezierBounds), CGRectGetMidY(bezierBounds)),
                                CGPointMake(CGRectGetMaxX(bezierBounds), CGRectGetMidY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    

    

    

    

}


@end
