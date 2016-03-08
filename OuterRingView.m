//
//  OuterRingView.m
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/7.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "OuterRingView.h"

@implementation OuterRingView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
        [self initView];
    
    return self;
}

- (void)initView{
    
    CGFloat startAngle   = M_PI * 1.5 + 55/360.f * M_PI * 2;
    CGFloat angle        = 110/360.f *2 * M_PI;
    CGFloat endAngle     = startAngle - angle;
    
    CGFloat X = CGRectGetWidth(self.frame)/2.f, Y = CGRectGetHeight(self.frame)/2.f, R = CGRectGetWidth(self.frame)/2.f - 10;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
    
    startAngle = endAngle - 10/360.f * M_PI*2;
    endAngle   = startAngle - angle;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
    
    startAngle = endAngle - 10/360.f * M_PI*2;
    endAngle   = startAngle - angle;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
}

- (void)addSubLayerWithCenter:(CGPoint)center Radius:(CGFloat)radius StartAngle:(CGFloat)startAngle EndAngle:(CGFloat)endAngle {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:false];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor   = [[UIColor whiteColor] CGColor];
    layer.fillColor     = [[UIColor clearColor] CGColor];
    layer.lineWidth     = 3.f;
    layer.lineCap       = @"round";
    
    [layer setPath:path.CGPath];
    
    layer.backgroundColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:layer];
}


@end
