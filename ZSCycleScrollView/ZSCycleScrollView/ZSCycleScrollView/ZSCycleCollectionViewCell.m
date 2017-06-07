//
//  ZSCycleCollectionViewCell.m
//  ZSCycleScrollView
//
//  Created by 紫贝壳 on 2017/6/5.
//  Copyright © 2017年 stark. All rights reserved.
//

#import "ZSCycleCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+ZSExtension.h"
@interface ZSCycleCollectionViewCell()
@property(nonatomic,strong)UIImageView *itemimgV;
@property(nonatomic,strong)UILabel *itemlab;
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
    
    UILabel *itemlab = [[UILabel alloc]init];
    itemlab.textColor = [UIColor whiteColor];
    self.itemlab = itemlab;
    itemlab.zs_width = self.contentView.zs_width - 20;
    itemlab.zs_height = 20;
    itemlab.zs_bottom = self.contentView.zs_bottom - 8;
    itemlab.zs_x = self.contentView.zs_x + 8;
    [self.contentView addSubview:itemlab];
}

-(void)setItemimgUrl:(NSString *)itemimgUrl{
    _itemimgUrl = itemimgUrl;
    if ([itemimgUrl hasPrefix:@"http"]) {
        [_itemimgV sd_setImageWithURL:[NSURL URLWithString:_itemimgUrl]];
    }else{
        _itemimgV.image = [UIImage imageNamed:itemimgUrl];
    }
}

-(void)setTextStr:(NSString *)textStr{
    _textStr = textStr;
    self.itemlab.text = textStr;
}
@end
