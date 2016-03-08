//
//  BcView.m
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/8.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "BcView.h"
#import "POP.h"

#import "RollNumberLabel.h"
#import "InnerRingView.h"
#import "OuterRingView.h"

@interface BcView ()

@property (nonatomic, strong) RollNumberLabel *m_numberLabel;

@property (nonatomic, strong) InnerRingView *m_innerRingView;

@property (nonatomic, strong) OuterRingView *m_outerRingView;

@end

@implementation BcView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    
    return self;
}

- (void)initView{
    self.m_outerRingView = [[OuterRingView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
    
    self.m_outerRingView.center = self.center;
    
    [self addSubview:self.m_outerRingView];
    
    self.m_innerRingView = [[InnerRingView alloc] initWithFrame:CGRectMake(0, 0, 240, 240)];
    
    self.m_innerRingView.center = self.center;
    
    [self addSubview:self.m_innerRingView];
    
    self.m_outerRingView.transform = CGAffineTransformMakeRotation(M_PI);
    
    self.m_innerRingView.transform = CGAffineTransformMakeRotation(M_PI/4 * 3);
    
    self.m_outerRingView.alpha = 0.1f;
    self.m_innerRingView.alpha = 0.1f;
    
    self.m_numberLabel = [[RollNumberLabel alloc] initWithFrame:self.m_innerRingView.frame];
    
    self.m_numberLabel.textColor     = [UIColor whiteColor];
    self.m_numberLabel.font          = [UIFont boldSystemFontOfSize:64];
    self.m_numberLabel.textAlignment = NSTextAlignmentCenter;
    self.m_numberLabel.text          = @"0";
    self.m_numberLabel.alpha         = 0.1f;
    
    [self addSubview:self.m_numberLabel];
}

#pragma mark - Animation
- (void)startRotatingAnimation{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    springAnimation.fromValue        = @(0.1);
    springAnimation.toValue          = @(1);
    springAnimation.beginTime        = CACurrentMediaTime();
    springAnimation.springSpeed      = 3.f;
    
    [self.m_outerRingView pop_addAnimation:springAnimation forKey:nil];
    [self.m_innerRingView pop_addAnimation:springAnimation forKey:nil];
    [self.m_numberLabel   pop_addAnimation:springAnimation forKey:nil];
    
    [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.m_outerRingView.transform = CGAffineTransformMakeRotation(0);
        self.m_innerRingView.transform = CGAffineTransformMakeRotation(0);
        
    } completion:^(BOOL finished) {
        [self loadProgress];
        
        [self.m_numberLabel startAnimationToValue:@65 Duration:1.75 Threshold:1.f];
    }];
}

- (void)loadProgress{
    self.m_innerRingView.m_progress = 0.65f;
}

@end
