# ZSCycleScrollView
    轻量级的轮播器,可以用于加载本地和网络图片轮播,简单易用

    用法:
    1, 导入"ZSCycleScrollView" 文件夹.

    2, 创建轮播器并添加到视图上
    ZSCycleScrollView *zsc = [ZSCycleScrollView zscycleScrollViewinitWithFrame:CGRectMake(0, 0, 375, 200) WithDelegate:self WithPlaceholdImg:nil];
       [self.view addSubview:zsc];
       
    3, 设置自定义样式\n
    zsc.pageStyle = ZSCycleScrollerViewPageControllerdefent;//分页指示器的形式
    
    zsc.pageState = ZSCycleScrollerViewPageControllerStateRight;//分页指示器的位置
    
    zsc.currentPageDotColor = [UIColor redColor];//分页指示器的当前分页指示器颜色
    
    zsc.pageDotColor = [UIColor yellowColor];//分页指示器其他分页指示器的颜色
    
    zsc.URLImgGroup = @[@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg"];//加载网络图片轮播
    
    zsc.locaImgGroup = @[@"0",@"1",@"2",@"3"];//加载本地图片轮播
    
    zsc.textGroup = @[@"111111111",@"22222222222",@"33333333333333",@"4444444444"];//加载轮播文本
    
    4, 轮播器点击分页相应事件
    -(void)ZSCycleDidClick:(ZSCycleScrollView *)zscycleScrollView Withindex:(NSInteger)index{
    NSLog(@"index====  %ld",(long)index);
}

    ********************* 简单创建的一个小DEMO 如果有问题或建议可以issuse   如果觉得可以,那就赏个星吧***********************
