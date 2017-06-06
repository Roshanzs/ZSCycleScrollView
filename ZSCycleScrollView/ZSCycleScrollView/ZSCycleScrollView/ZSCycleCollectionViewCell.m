//
//  ZSCycleCollectionViewCell.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ZSCycleCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZSCycleCollectionViewCell()
@property(nonatomic,strong)UIImageView *itemimgV;
@end

@implementation ZSCycleCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    };
    return self;
}


-(void)setupUI{
    self.itemimgV = [[UIImageView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:_itemimgV];
}

-(void)setItemimgUrl:(NSString *)itemimgUrl{
    _itemimgUrl = itemimgUrl;
    [_itemimgV sd_setImageWithURL:[NSURL URLWithString:_itemimgUrl]];
}
@end
