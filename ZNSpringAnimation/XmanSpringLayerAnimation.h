//
//  XmanSpringLayerAnimation.h
//  ZNSpringAnimation
//
//  Created by 嗯你懂的 on 16/8/11.
//  Copyright © 2016年 zn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XmanCAShapeLayer;
@interface XmanSpringLayerAnimation : NSObject

+(instancetype)sharedAnimManager;


-(CAKeyframeAnimation *)createSpringAnima:(NSString *)keypath duration:(CFTimeInterval)duration usingSpringWithDamping:(CGFloat)damping initialSpringVelocity:(CGFloat)velocity fromValue:(id)fromValue toValue:(id)toValue shapeLayer:(XmanCAShapeLayer *)XmanLayer;

@end
