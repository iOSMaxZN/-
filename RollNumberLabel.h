//
//  RollNumberLabel.h
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/8.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollNumberLabel : UILabel

- (void)startAnimationToValue:(NSNumber *)toValue Duration:(CGFloat)duration Threshold:(CGFloat)threshold;

@end
