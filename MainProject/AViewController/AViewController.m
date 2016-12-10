//
//  AViewController.m
//  MainProject
//
//  Created by casa on 2016/12/10.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface AViewController ()

@property (nonatomic, strong) UIButton *pushBViewControllerButton;

@end

@implementation AViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pushBViewControllerButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self.pushBViewControllerButton sizeToFit];
    [self.pushBViewControllerButton centerEqualToView:self.view];
}

#pragma mark - event response
- (void)didTappedPushBViewControllerButton:(UIButton *)button
{
    BViewController *viewController = [[BViewController alloc] initWithContentText:@"hello, world!"];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getters and setters
- (UIButton *)pushBViewControllerButton
{
    if (_pushBViewControllerButton == nil) {
        _pushBViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushBViewControllerButton setTitle:@"push B view controller" forState:UIControlStateNormal];
        [_pushBViewControllerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_pushBViewControllerButton addTarget:self action:@selector(didTappedPushBViewControllerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBViewControllerButton;
}

@end
