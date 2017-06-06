//
//  ZSCycleScrollView.h
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSCycleScrollView : UIView

//初始化方法
+(instancetype)zscycleScrollViewinitWithFrame:(CGRect)frame;

//本地图片数组
@property(nonatomic,strong)NSArray *locaImgGroup;

//文本数组
@property(nonatomic,strong)NSArray *textGroup;
@end
