//
//  PViewController.m
//  3DTouch
//
//  Created by HChong on 16/5/10.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "PeekViewController.h"

@interface PeekViewController ()<UIPreviewActionItem>

@property(nonatomic, strong) UILabel *label;
@end

@implementation PeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.label];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.label.frame = CGRectMake(100, 200, 200, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPreviewActionItem
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *ac1 = [UIPreviewAction actionWithTitle:@"返回" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *ac2 = [UIPreviewAction actionWithTitle:@"嘟嘟嘟" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *ac3 = [UIPreviewAction actionWithTitle:@"Hello" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    return [NSArray arrayWithObjects:ac1, ac2, ac3, nil];
}

#pragma mark - getter, setter
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:14];
        _label.text = @"继续重压, Pop出新界面";
        _label.backgroundColor = [UIColor yellowColor];
    }
    return _label;
}


@end
