//
//  ViewController.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ViewController.h"
#import "ZSCycleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ZSCycleScrollView *zsc = [ZSCycleScrollView zscycleScrollViewinitWithFrame:CGRectMake(0, 0, 375, 200)];
    zsc.locaImgGroup = @[@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg"];
    [self.view addSubview:zsc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
