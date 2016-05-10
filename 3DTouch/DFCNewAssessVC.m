//
//  DFCNewAssessVC.m
//  3DTouch
//
//  Created by HChong on 16/5/10.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "DFCNewAssessVC.h"

@interface DFCNewAssessVC ()

@end

@implementation DFCNewAssessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 100);
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
