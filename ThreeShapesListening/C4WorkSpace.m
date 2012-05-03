//
//  C4WorkSpace.m
//  ThreeShapesListening
//
//  Created by Jordan Peterson on 12-05-03.
//  Copyright (c) 2012 ACAD. All rights reserved.
//

#import "C4WorkSpace.h"
#import "MyButton.h"

@interface C4WorkSpace() 
-(void)setCanvasColorToBlack;
-(void)setCanvasColorToGrey;
-(void)setCanvasColorToWhite;
@end

@implementation C4WorkSpace {
    int canvasWidth, canvasHeight;
    CGPoint centerPos;
    CGFloat buttonWidth, buttonHeight;
    MyButton *button1, *button2, *button3;
}

-(void)setup {
    buttonWidth = 200.0f;
    buttonHeight = 200.0f;
    
    canvasWidth = self.canvas.bounds.size.width;
    canvasHeight = self.canvas.bounds.size.height;
    centerPos = CGPointMake(canvasWidth/2, canvasHeight/2);
    
    button1 = [MyButton new];
    button2 = [MyButton new];
    button3 = [MyButton new];
    
    [button1 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, 80.0f, buttonWidth, buttonHeight)];
    button1.strokeColor = [UIColor darkGrayColor];
    button1.fillColor = [UIColor blackColor];
    [self.canvas addShape:button1];
    
    [button2 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, centerPos.y - buttonHeight/2.0f, buttonWidth, buttonHeight)];
    button2.strokeColor = [UIColor darkGrayColor];
    button2.fillColor = [UIColor grayColor];
    [self.canvas addShape:button2];
    
    [button3 rect:CGRectMake(centerPos.x - buttonWidth/2.0f, canvasHeight - 280.0f, buttonWidth, buttonHeight)];
    button3.strokeColor = [UIColor darkGrayColor];
    button3.fillColor = [UIColor whiteColor];
    [self.canvas addShape:button3];
    
    [button1 listenFor:@"touchesBegan" fromObject:button1 andRunMethod:@"newShape"];
    [button2 listenFor:@"touchesBegan" fromObject:button2 andRunMethod:@"newShape"];
    [button3 listenFor:@"touchesBegan" fromObject:button3 andRunMethod:@"newShape"];
    
    [button1 listenFor:@"touchesBegan" fromObject:button2 andRunMethod:@"resetShape"];
    [button1 listenFor:@"touchesBegan" fromObject:button3 andRunMethod:@"resetShape"];
    [button2 listenFor:@"touchesBegan" fromObject:button1 andRunMethod:@"resetShape"];
    [button2 listenFor:@"touchesBegan" fromObject:button3 andRunMethod:@"resetShape"];    
    [button3 listenFor:@"touchesBegan" fromObject:button1 andRunMethod:@"resetShape"];
    [button3 listenFor:@"touchesBegan" fromObject:button2 andRunMethod:@"resetShape"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setCanvasColorToBlack) name:@"touchesBegan" object:button1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setCanvasColorToGrey) name:@"touchesBegan" object:button2];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setCanvasColorToWhite) name:@"touchesBegan" object:button3];
}

-(void)setCanvasColorToBlack {
    self.canvas.backgroundColor = [UIColor blackColor];
}

-(void)setCanvasColorToGrey {
    self.canvas.backgroundColor = [UIColor grayColor];
}

-(void)setCanvasColorToWhite {
    self.canvas.backgroundColor = [UIColor whiteColor];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //
}

@end
