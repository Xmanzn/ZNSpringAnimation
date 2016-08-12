//
//  XmanSpringLayerAnimation.m
//  ZNSpringAnimation
//
//  Created by 嗯你懂的 on 16/8/11.
//  Copyright © 2016年 zn. All rights reserved.
//

#import "XmanSpringLayerAnimation.h"
#import "XmanCAShapeLayer.h"

@implementation XmanSpringLayerAnimation

+(instancetype)sharedAnimManager{
    
    static XmanSpringLayerAnimation *animManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        animManager = [[XmanSpringLayerAnimation alloc]init];
    });
    return animManager;
}

-(CAKeyframeAnimation *)createSpringAnima:(NSString *)keypath duration:(CFTimeInterval)duration usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity fromValue:(id)fromValue toValue:(id)toValue shapeLayer:(XmanCAShapeLayer *)XmanLayer{
    
    CGFloat dampingFactor  = 10.0;
    CGFloat velocityFactor = 10.0;
    NSMutableArray *values = [self springAnimationValues:fromValue toValue:toValue usingSpringWithDamping:damping * dampingFactor initialSpringVelocity:velocity * velocityFactor duration:duration ];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:keypath];
    anim.values = values;
    anim.duration = duration;
    anim.delegate = XmanLayer;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    return anim;
}
-(NSMutableArray *) springAnimationValues:(id)fromValue toValue:(id)toValue usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity duration:(CGFloat)duration {
    
    //60个关键帧,＊60 numOfFrames
    NSInteger numOfFrames  = duration * 60;
    NSMutableArray *myValues = [NSMutableArray arrayWithCapacity:numOfFrames];
    for (NSInteger i = 0; i < numOfFrames; i++) {
        [myValues addObject:@(0.0)];
    }
    
    CGFloat diff = [toValue floatValue] - [fromValue floatValue];
    
    for (NSInteger frame = 0; frame<numOfFrames; frame++) {
        
        CGFloat x = (CGFloat)frame / (CGFloat)numOfFrames;
        CGFloat value = [toValue floatValue] - diff * (pow(M_E, -damping * x) * cos(velocity * x));
        // y = 1-e^{-5x} * cos(30x)  弹性函数
        
            myValues[frame] = @(ABS(value));
    }
    
    [myValues removeLastObject];
    [myValues addObject:toValue];
    return myValues;
}


@end
