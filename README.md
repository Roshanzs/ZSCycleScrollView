# ZSCycleScrollView
轻量级的轮播器,可以用于加载本地和网络图片轮播,简单易用\n\n

用法:\n
1, 导入"ZSCycleScrollView" 文件夹.\n\n

2, 创建轮播器并添加到视图上\n
       ZSCycleScrollView *zsc = [ZSCycleScrollView zscycleScrollViewinitWithFrame:CGRectMake(0, 0, 375, 200) WithDelegate:self WithPlaceholdImg:nil];\n
       [self.view addSubview:zsc];\n\n
       
3, 设置自定义样式\n
    zsc.pageStyle = ZSCycleScrollerViewPageControllerdefent;//分页指示器的形式\n\n
    
    zsc.pageState = ZSCycleScrollerViewPageControllerStateRight;//分页指示器的位置\n\n
    
    zsc.currentPageDotColor = [UIColor redColor];//分页指示器的当前分页指示器颜色\n\n
    
    zsc.pageDotColor = [UIColor yellowColor];//分页指示器其他分页指示器的颜色\n\n
    
    zsc.URLImgGroup = @[@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",@"http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg"];//加载网络图片轮播\n\n
    
    zsc.locaImgGroup = @[@"0",@"1",@"2",@"3"];//加载本地图片轮播\n\n
    
    zsc.textGroup = @[@"111111111",@"22222222222",@"33333333333333",@"4444444444"];//加载轮播文本\n\n
    
4, 轮播器点击分页相应事件\n
    -(void)ZSCycleDidClick:(ZSCycleScrollView *)zscycleScrollView Withindex:(NSInteger)index{\n
    NSLog(@"index====  %ld",(long)index);\n
}\n\n

********************* 简单创建的一个小DEMO 如果有问题或建议可以issuse   如果觉得可以,那就赏个星吧 ***************************************
