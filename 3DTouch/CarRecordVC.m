//
//  CarRecordVC.m
//  3DTouch
//
//  Created by HChong on 16/4/25.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "CarRecordVC.h"

@interface CarRecordVC()

@property(nonatomic, strong) UIView *testView;
@end

@implementation CarRecordVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //检测3D Touch是否可用
    if (self.traitCollection.forceTouchCapability != UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch不可用");
    }
}

//使用过程中关闭了3D Touch功能
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (self.traitCollection.forceTouchCapability != UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch不可用");
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.testView.frame = CGRectMake(100, 200, 100, 100);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
//检测压力大小, 压力越大, 颜色越深, 
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSLog(@"%f", touch.force);
    self.view.backgroundColor = [UIColor colorWithRed:(touch.force / touch.maximumPossibleForce )green:0 blue:1 alpha:1];
}

#pragma mark - getter, setter
-(UIView *)testView {
    if (!_testView) {
        _testView = [[UIView alloc] init];
    }
    _testView.backgroundColor = [UIColor yellowColor];
    return _testView;
}


@end
