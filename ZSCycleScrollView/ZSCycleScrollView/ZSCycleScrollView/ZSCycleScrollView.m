//
//  ZSCycleScrollView.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ZSCycleScrollView.h"
#import "ZSCycleCollectionViewCell.h"
#import "UIView+ZSExtension.h"
@interface ZSCycleScrollView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionview;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowlayout;
//轮播的图片数
@property(nonatomic,assign)CGFloat cycleNumber;

@property(nonatomic,strong)UIPageControl *pagecontrol;

@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,assign)int currItem;

@end

#define screenW [UIScreen mainScreen].bounds.size.width
#define collectioncell @"collectioncell"
@implementation ZSCycleScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

+(instancetype)zscycleScrollViewinitWithFrame:(CGRect)frame{
    ZSCycleScrollView *zsc = [[ZSCycleScrollView alloc]initWithFrame:frame];
    zsc.backgroundColor = [UIColor yellowColor];
    return zsc;
}

-(void)setupUI{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowlayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    flowLayout.itemSize = self.bounds.size;
    mainView.backgroundColor = [UIColor clearColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[ZSCycleCollectionViewCell class] forCellWithReuseIdentifier:collectioncell];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _collectionview = mainView;
    
    self.pagecontrol = [[UIPageControl alloc]init];
    _pagecontrol.zs_width = screenW;
    _pagecontrol.zs_height = 10;
    _pagecontrol.zs_right = self.zs_right;
    _pagecontrol.zs_bottom = self.zs_bottom - 8;
    _pagecontrol.numberOfPages = 3;
    _pagecontrol.currentPage = 1;
    [self addSubview:_pagecontrol];
    self.currItem = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerMenth) userInfo:nil repeats:YES];
}

-(void)layoutSubviews{
    [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

}

-(void)setLocaImgGroup:(NSArray *)locaImgGroup{
    _locaImgGroup = locaImgGroup;
    _cycleNumber = locaImgGroup.count;
}

//定时器
-(void)timerMenth{
//    [self.collectionview scrollToItemAtIndexPath:nil atScrollPosition:nil
//                                        animated:YES];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cycleNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZSCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectioncell forIndexPath:indexPath];
//    if (indexPath.item == _cycleNumber) {
//        cell.itemimgUrl = _locaImgGroup[0];
//    }else{
//        cell.itemimgUrl = _locaImgGroup[indexPath.item];
//    }
    
    UILabel *lab = [[UILabel alloc]initWithFrame:cell.contentView.bounds];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = [NSString stringWithFormat:@"第%ld个",(long)indexPath.item];
    [cell.contentView addSubview:lab];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f",scrollView.contentOffset.x);
    CGFloat tempoffset = scrollView.contentOffset.x;
    if (tempoffset >= screenW * 0.5) {
        
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
        NSLog(@"%f",scrollView.contentOffset.x);
    CGFloat offset = scrollView.contentOffset.x;
    if (offset == screenW * (_cycleNumber - 1)) {
        [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_cycleNumber - 1 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    if (offset == screenW * (_cycleNumber * 2)) {
        [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}

@end
