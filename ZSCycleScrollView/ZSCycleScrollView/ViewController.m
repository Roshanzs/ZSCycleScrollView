//
//  ViewController.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ViewController.h"
#import "ZSCycleScrollView.h"

@interface ViewController ()<ZSCycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ZSCycleScrollView *zsc = [ZSCycleScrollView zscycleScrollViewinitWithFrame:CGRectMake(0, 0, 375, 200)];
    zsc.delegate = self;
    zsc.locaImgGroup = @[@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg"];
    zsc.textGroup = @[@"111111111",@"22222222222",@"33333333333333",@"4444444444"];
    [self.view addSubview:zsc];
}

-(void)ZSCycleDidClick:(ZSCycleScrollView *)zscycleScrollView Withindex:(NSInteger)index{
    NSLog(@"index====  %ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
