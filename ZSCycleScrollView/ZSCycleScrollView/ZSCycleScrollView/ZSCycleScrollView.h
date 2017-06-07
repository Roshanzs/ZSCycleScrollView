//
//  ZSCycleScrollView.h
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSCycleScrollView;
@protocol ZSCycleScrollViewDelegate <NSObject>

//轮播器点击事件
-(void)ZSCycleDidClick:(ZSCycleScrollView *)zscycleScrollView Withindex:(NSInteger)index;

@end


@interface ZSCycleScrollView : UIView

//初始化方法
+(instancetype)zscycleScrollViewinitWithFrame:(CGRect)frame;

@property(nonatomic,weak)id<ZSCycleScrollViewDelegate> delegate;

//本地图片数组
@property(nonatomic,strong)NSArray *locaImgGroup;

//文本数组
@property(nonatomic,strong)NSArray *textGroup;
@end
