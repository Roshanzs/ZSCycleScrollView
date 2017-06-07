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
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerMenth) userInfo:nil repeats:YES];
}

-(void)layoutSubviews{
    [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

//    self.pagecontrol = [[UIPageControl alloc]init];
//    _pagecontrol.zs_width = 12 * _cycleNumber;
//    _pagecontrol.zs_height = 10;
//    _pagecontrol.zs_right = self.zs_right - 10;
//    _pagecontrol.zs_bottom = self.zs_bottom - 10;
//    _pagecontrol.numberOfPages = _cycleNumber;
//    [self addSubview:_pagecontrol];
    [self setPageStyleWithpagestyle:_pageStyle];
}

-(void)setLocaImgGroup:(NSArray *)locaImgGroup{
    _locaImgGroup = locaImgGroup;
    _cycleNumber = locaImgGroup.count;
}

-(void)setTextGroup:(NSArray *)textGroup{
    _textGroup = textGroup;
}

-(void)setPageState:(ZSCycleScrollerViewPageControllerState)pageState{
    _pageState = pageState;
//    [self setPageStateWithpagestate:pageState];
}

-(void)setPageStyle:(ZSCycleScrollerViewPageControllerStyte)pageStyle{
    _pageStyle = pageStyle;
    [self setPageStyleWithpagestyle:pageStyle];
}

//设置page
-(void)setPageStyleWithpagestyle:(ZSCycleScrollerViewPageControllerStyte)pagestyle{
    if (_pagecontrol) {
        [_pagecontrol removeFromSuperview];
    }
    switch (pagestyle) {
        case ZSCycleScrollerViewPageControllerdefent:
        {
            self.pagecontrol = [[UIPageControl alloc]init];
            _pagecontrol.zs_width = 12 * _cycleNumber;
            _pagecontrol.zs_height = 10;
            _pagecontrol.zs_right = self.zs_right - 10;
            _pagecontrol.zs_bottom = self.zs_bottom - 10;
            _pagecontrol.numberOfPages = _cycleNumber;
            [self addSubview:_pagecontrol];
 
        }
            break;
        case ZSCycleScrollerViewPageControllerhide:
        {
        }
            break;

            
        default:
            break;
    }
}

//定时器
-(void)timerMenth{
    // 获取当前的 indexPath
    NSIndexPath *currentIndexPath = [[self.collectionview indexPathsForVisibleItems] lastObject];
    NSIndexPath *currentIndexPathSet = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:1];
    
    [self.collectionview scrollToItemAtIndexPath:currentIndexPathSet atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    // 设置下一个滚动的item的indexPath
    NSInteger nextItem = currentIndexPathSet.item + 1;
    NSInteger nextSection = currentIndexPathSet.section;
    if (nextItem == self.locaImgGroup.count) {
        // 当item等于轮播图的总个数的时候
        // item等于0, 分区加1
        nextItem = 0;
        nextSection ++;
    }
    // NSLog(@"----%ld---%ld", nextItem, nextSection);
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionview scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    _pagecontrol.currentPage = nextItem;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cycleNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZSCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectioncell forIndexPath:indexPath];
        cell.itemimgUrl = _locaImgGroup[indexPath.item];
        cell.textStr = _textGroup[indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(ZSCycleDidClick:Withindex:)]) {
        [self.delegate ZSCycleDidClick:self Withindex:indexPath.item];
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerMenth) userInfo:nil repeats:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//        NSLog(@"%f",scrollView.contentOffset.x / screenW);
    CGFloat offset = scrollView.contentOffset.x;
    _pagecontrol.currentPage = offset / screenW - _cycleNumber;
    if (offset <= screenW * (_cycleNumber - 1)) {
        [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_cycleNumber - 1 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        _pagecontrol.currentPage = _cycleNumber - 1;

    }
    if (offset >= screenW * (_cycleNumber * 2)) {
        [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        _pagecontrol.currentPage = 0;

    }
}

@end
