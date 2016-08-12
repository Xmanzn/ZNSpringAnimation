//
//  XmanCAShapeLayer.m
//  ZNSpringAnimation
//
//  Created by 嗯你懂的 on 16/8/12.
//  Copyright © 2016年 zn. All rights reserved.
//

#import "XmanCAShapeLayer.h"


@implementation XmanCAShapeLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//layer首次加载时会调用 此方法来判断当前指定的属性key改变是否需要重新绘制。
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual:@"strokeEnd"]) {
        return  YES;
        
    }else {
        return  [super needsDisplayForKey:key];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self removeAnimationForKey:_animationKey];
    [self setNeedsDisplay];
}

@end
