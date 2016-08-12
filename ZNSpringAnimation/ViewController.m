//
//  ViewController.m
//  ZNSpringAnimation
//
//  Created by 嗯你懂的 on 16/8/5.
//  Copyright © 2016年 zn. All rights reserved.
//

#import "ViewController.h"
#import "XmanCAShapeLayer.h"
#import "XmanSpringLayerAnimation.h"
@interface ViewController ()
@end

@implementation ViewController {
    XmanCAShapeLayer *circleShape;
    XmanCAShapeLayer *lineShape;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)line {
    lineShape = [[XmanCAShapeLayer alloc] init];
    CGMutablePathRef linePath =nil;
    
    linePath = CGPathCreateMutable();
    lineShape.lineWidth=2.0f;
    lineShape.lineCap = kCALineCapRound;;
    lineShape.strokeColor= [UIColor blackColor].CGColor;
    
    CGPoint p = CGPointMake(self.view.center.x, 20);
    
    CGPathMoveToPoint(linePath,NULL, p.x, p.y);
    CGPathAddLineToPoint(linePath,NULL, p.x,400);
    
    lineShape.path= linePath;
    
    CAKeyframeAnimation *keyAnmi = [[XmanSpringLayerAnimation sharedAnimManager] createSpringAnima:@"strokeEnd" duration:5 usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(0) toValue:@(1) shapeLayer:lineShape];
    
    lineShape.animationKey = @"line";
    [lineShape addAnimation:keyAnmi forKey:lineShape.animationKey];
    [self.view.layer addSublayer:lineShape];

}

- (void)circle {
    circleShape= [[XmanCAShapeLayer alloc] init];
    
    circleShape.frame = CGRectMake(0, 0, 150, 150);
    circleShape.position = self.view.center;
    circleShape.fillColor = [UIColor clearColor].CGColor;
    
    circleShape.lineWidth = 2.0f;
    circleShape.strokeColor = [UIColor redColor].CGColor;
    
    circleShape.strokeStart = 0;
    //    self.shapeLayer.strokeEnd = 0.5;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    circleShape.path = circlePath.CGPath;
    
    
    CAKeyframeAnimation *keyAnmi = [[XmanSpringLayerAnimation sharedAnimManager] createSpringAnima:@"strokeEnd" duration:5 usingSpringWithDamping:0.5 initialSpringVelocity:3 fromValue:@(0) toValue:@(1) shapeLayer:circleShape];
    
    circleShape.animationKey = @"line";
    [circleShape addAnimation:keyAnmi forKey:circleShape.animationKey];
    [self.view.layer addSublayer:circleShape];
    
}

- (IBAction)cleanLayer:(id)sender {
    [lineShape removeFromSuperlayer];
    [circleShape removeFromSuperlayer];
}

- (IBAction)showline:(id)sender {
    [self line];
}

- (IBAction)showCircle:(id)sender {
    [self circle];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
