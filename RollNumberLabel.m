//
//  RollNumberLabel.m
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/8.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "RollNumberLabel.h"
#import "POP.h"

@implementation RollNumberLabel

- (void)startAnimationToValue:(NSNumber *)toValue Duration:(CGFloat)duration Threshold:(CGFloat)threshold{
    POPBasicAnimation *basicAnimation = [POPBasicAnimation animation];
    basicAnimation.duration = duration;
    
    POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"rollNumber" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(UILabel *label, CGFloat values[]){
            values[0] = [label.text integerValue];
        };
        
        prop.writeBlock = ^ (UILabel *label, const CGFloat values[]){
            label.text = [NSString stringWithFormat:@"%.0f", values[0]];
        };
        
        prop.threshold = threshold;
    }];
    
    basicAnimation.property  = property;
    basicAnimation.fromValue = @0;
    basicAnimation.toValue   = @65;
    basicAnimation.beginTime = CACurrentMediaTime() + 0.1f;
    
    basicAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {// Callback，动画的执行过程会不断调用这个 block 、监听动画是否结束
        if (finished)
            [self pop_removeAnimationForKey:@"rollNumber"];
    };

    [self pop_addAnimation:basicAnimation forKey:@"rollNumber"];
}

@end
