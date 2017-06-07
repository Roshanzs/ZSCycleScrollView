//
//  ZSCycleScrollView.h
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZSCycleScrollerViewPageControllerStateCenter,
    ZSCycleScrollerViewPageControllerStateRight
}ZSCycleScrollerViewPageControllerState;

typedef enum {
    ZSCycleScrollerViewPageControllerdefent,//默认样式
    ZSCycleScrollerViewPageControllerhide,//隐藏pager
}ZSCycleScrollerViewPageControllerStyte;


@class ZSCycleScrollView;
@protocol ZSCycleScrollViewDelegate <NSObject>

//轮播器点击事件
-(void)ZSCycleDidClick:(ZSCycleScrollView *)zscycleScrollView Withindex:(NSInteger)index;

@end


@interface ZSCycleScrollView : UIView

//初始化方法
+(instancetype)zscycleScrollViewinitWithFrame:(CGRect)frame WithDelegate:(id<ZSCycleScrollViewDelegate>)delegate WithPlaceholdImg:(UIImage *)placeholdimg;

@property(nonatomic,weak)id<ZSCycleScrollViewDelegate> delegate;

//网络图片数组
@property(nonatomic,strong)NSArray *URLImgGroup;

//本地图片组
@property(nonatomic,strong)NSArray *locaImgGroup;

//占位图片
@property(nonatomic,strong)UIImage *placeholdimg;

//文本数组
@property(nonatomic,strong)NSArray *textGroup;

//分页控制符的位置
@property(nonatomic,assign)ZSCycleScrollerViewPageControllerState pageState;

//分页控制符的样式
@property(nonatomic,assign)ZSCycleScrollerViewPageControllerStyte pageStyle;

/** 当前分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *currentPageDotColor;

/** 其他分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *pageDotColor;

@end
