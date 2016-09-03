//
//  EasingGradient.m
//  XFCrystalKitExample
//
//  Created by 付星 on 16/8/19.
//  Copyright © 2016年 yizzuide. All rights reserved.
//

#import "EasingGradient.h"
#import "XFCrystalKit.h"

@implementation EasingGradient

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    MovePathCenterToPoint(path, RectGetCenter(rect));
    
    /*Gradient *gradient = [Gradient gradientUsingInterpolationBlock:^CGFloat(CGFloat percent) {
     //return EaseIn(percent, 2);
     return EaseOut(percent, 3);
     } between:WHITE_LEVEL(0, 0) and:WHITE_LEVEL(0, 1)];*/
    XFGradient *gradient = [XFGradient easeInGradientBetween:WHITE_LEVEL(0, 0) and:WHITE_LEVEL(0, 1)];
    // Calculate the points
    CGPoint p1 = RectGetPointAtPercents(path.bounds, 0.7, 0.5);
    CGPoint p2 = RectGetPointAtPercents(path.bounds, 1.0, 0.5);
    
    // Draw a green background
    [path fill:[UIColor greenColor]];
    
    // clip path bounds
    [path clipToPath];
    
    // Draw the gradient across the green background
    //[gradient drawFrom:p1 toPoint:p2 style:0];
    [gradient drawFrom:p1 toPoint:p2];
}
@end
