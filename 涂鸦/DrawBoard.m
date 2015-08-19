//
//  DrawBoard.m
//  涂鸦
//
//  Created by Guan on 15/8/6.
//  Copyright (c) 2015年 Guan. All rights reserved.
//

#import "DrawBoard.h"

@interface DrawBoard()

//该属性弃用
@property (nonatomic,strong)NSMutableArray *points;

@property (nonatomic,strong)NSMutableArray *pathes;

@property (nonatomic,strong)UIBezierPath *currenctPath;

@end

@implementation DrawBoard

-(NSMutableArray *)points
{
  if (!_points ) {
        _points = [[NSMutableArray alloc]init];
    }
    return _points;
}

-(NSMutableArray *)pathes
{
    if (!_pathes ) {
        _pathes = [[NSMutableArray alloc]init];
    }
    return _pathes;
}

/**在这里确定起点*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startP = [touch locationInView:touch.view];
    _currenctPath = [UIBezierPath bezierPath];
    _currenctPath.lineWidth = 10;
    _currenctPath.lineJoinStyle = kCGLineJoinRound;
    [_currenctPath moveToPoint:startP];
    [self.pathes addObject:_currenctPath];
    [self setNeedsDisplay ];
}
/**连线*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endP = [touch locationInView:touch.view];
    [(UIBezierPath*)[self.pathes lastObject] addLineToPoint:endP];
   [self setNeedsDisplay ];
    _currenctPath = nil;
}

/**连线*/
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint currenctP = [touch locationInView:touch.view];
 [(UIBezierPath*)[self.pathes lastObject] addLineToPoint:currenctP];
    [self setNeedsDisplay ];
}



- (void)drawRect:(CGRect)rect {

    for (int j = 0 ; j < self.pathes.count; j ++ ) {
  
        UIBezierPath *path = self.pathes[j];
        [path stroke];
    }
}

- (void)clearAll
{
    [self.pathes removeAllObjects];
    [self setNeedsDisplay];
}

- (void)goBack
{
    [self.pathes removeLastObject];
    [self setNeedsDisplay];
}



@end
