//
//  RootViewController.m
//  3DTouch
//
//  Created by HChong on 16/5/10.
//  Copyright © 2016年 HChong. All rights reserved.
//

#import "RootViewController.h"
#import "CarRecordVC.h"
#import "DFCNewAssessVC.h"
#import "PeekViewController.h"
#import "PopViewController.h"

#define kDeviceSize [UIScreen mainScreen].bounds.size
@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.dataArray = @[@"To CarRecordVC", @"To DFCNewAssessVC", @"单纯的Peek+Pop", @"在PeekVC中实现UIPreviewActionItem代理, 带有底部滑动的Peek"];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        return 80;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
#ifdef __IPHONE_9_0
    //注册Peek, Pop的代理
    [self registerForPreviewingWithDelegate:self sourceView:cell];
#endif
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CarRecordVC *vc= [[CarRecordVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    if (indexPath.row == 1) {
        DFCNewAssessVC *vc= [[DFCNewAssessVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
}

#pragma mark UIViewControllerPreviewingDelegate
//peek代理方法
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    //获得当前cell的indexPath
    NSIndexPath * index = [self.tableView indexPathForCell:(UITableViewCell *)previewingContext.sourceView];
    if (index.row == 2 || index.row == 3) {
        PeekViewController *pVC = [[PeekViewController alloc] init];
        return pVC;
    }
    
    return nil;
}

//pop代理方法
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    //在Peek出来的页面继续重压实现Pop
    PopViewController *pVC = [[PopViewController alloc] init];
    [self showViewController:pVC sender:self];
}

#pragma mark - getter/setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kDeviceSize.width, kDeviceSize.height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}

@end
