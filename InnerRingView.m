//
//  InnerRingView.m
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/7.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "InnerRingView.h"
#import "POP.h"

@interface InnerRingView ()

@property (nonatomic, strong) NSMutableArray *m_layersArray;

@end

@implementation InnerRingView

- (NSMutableArray *)m_layersArray{
    if (_m_layersArray == nil)
        _m_layersArray = [NSMutableArray array];
    
    return _m_layersArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
        [self initView];
    
    return self;
}

- (void)initView{
    
    CGFloat startAngle   = M_PI * 1.5 + 52.5/360.f * M_PI * 2;
    CGFloat angle        = 105/360.f *2 * M_PI;
    CGFloat endAngle     = startAngle - angle;
    
    CGFloat X = CGRectGetWidth(self.frame)/2.f, Y = CGRectGetHeight(self.frame)/2.f, R = CGRectGetWidth(self.frame)/2.f - 10;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
    [self addProgressLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:endAngle EndAngle:startAngle];
    
    startAngle = endAngle - 15/360.f * M_PI*2;
    endAngle   = startAngle - angle;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
    [self addProgressLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:endAngle EndAngle:startAngle];
    
    startAngle = endAngle - 15/360.f * M_PI*2;
    endAngle   = startAngle - angle;
    
    [self addSubLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:startAngle EndAngle:endAngle];
    [self addProgressLayerWithCenter:CGPointMake(X, Y) Radius:R StartAngle:endAngle EndAngle:startAngle];
}

- (void)addSubLayerWithCenter:(CGPoint)center Radius:(CGFloat)radius StartAngle:(CGFloat)startAngle EndAngle:(CGFloat)endAngle {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:false];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor     = [[UIColor clearColor] CGColor];
    layer.lineWidth     = 12.f;
    layer.lineCap       = @"round";
    
    layer.strokeColor = [[UIColor colorWithRed:108/255.f green:211/255.f blue:177/255.f alpha:1.f] CGColor];
    
    [layer setPath:path.CGPath];
    
    layer.backgroundColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:layer];
}

- (void)addProgressLayerWithCenter:(CGPoint)center Radius:(CGFloat)radius StartAngle:(CGFloat)startAngle EndAngle:(CGFloat)endAngle {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor     = [[UIColor clearColor] CGColor];
    layer.lineWidth     = 12.f;
    layer.lineCap       = @"round";
    layer.strokeColor   = [[UIColor whiteColor] CGColor];
    layer.strokeEnd     = 0.f;
    
    [layer setPath:path.CGPath];
    
    layer.backgroundColor = [[UIColor clearColor] CGColor];
    
    [self.layer addSublayer:layer];
    
    [self.m_layersArray addObject:layer];
}

- (void)setM_progress:(CGFloat)m_progress{
    self->_m_progress = m_progress;
    
    [self progressAnimation];
}

- (void)progressAnimation{
    for (CAShapeLayer *layer in self.m_layersArray) {
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
        animation.toValue          = @(self.m_progress);
        animation.beginTime        = CACurrentMediaTime() + 0.1;
        animation.springBounciness = 3.f;
        animation.springSpeed      = 8.f;
        animation.dynamicsMass     = 6.f;
        
        [layer pop_addAnimation:animation forKey:@"strokeEnd"];
    }
}

@end
