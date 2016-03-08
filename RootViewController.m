//
//  RootViewController.m
//  内外环旋转进度条Demo
//
//  Created by iOSMax on 16/3/7.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import "RootViewController.h"
#import "BcView.h"

#import "POP.h"

@interface RootViewController ()

@property (nonatomic, strong) BcView *m_bcView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)initView{
    self.view.backgroundColor = [UIColor colorWithRed:40/255.f green:213/255.f blue:132/255.f alpha:1];

    
    self.m_bcView = [[BcView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
    
    self.m_bcView.center = self.view.center;
    
    [self.view addSubview:self.m_bcView];
    
    [self.m_bcView performSelector:@selector(startRotatingAnimation) withObject:nil afterDelay:1.f];
}


@end
