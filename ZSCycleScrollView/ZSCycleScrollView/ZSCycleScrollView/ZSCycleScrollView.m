//
//  ZSCycleScrollView.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ZSCycleScrollView.h"

@interface ZSCycleScrollView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionview;
@property(nonatomic,strong)UICollectionViewFlowLayout *flowlayout;
//轮播的图片数
@property(nonatomic,assign)CGFloat cycleNumber;

@end

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
    [mainView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectioncell];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _collectionview = mainView;
}

-(void)setLocaImgGroup:(NSArray *)locaImgGroup{
    _locaImgGroup = locaImgGroup;
    _cycleNumber = locaImgGroup.count;
}

//collection的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cycleNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectioncell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

@end
