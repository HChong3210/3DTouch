//
//  DFCNewAssessVC.m
//  3DTouch
//
//  Created by HChong on 16/5/10.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "DFCNewAssessVC.h"

@interface DFCNewAssessVC ()

@property(nonatomic, strong) UIButton *button;
@end

@implementation DFCNewAssessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.button];
}
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
    self.button.frame = CGRectMake(100, 200, 100, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (void)buttonAction {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - setter, getter
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor yellowColor];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
