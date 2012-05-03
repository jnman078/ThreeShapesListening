//
//  MyButton.m
//  ThreeShapesListening
//
//  Created by Jordan Peterson on 12-05-03.
//  Copyright (c) 2012 ACAD. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(id)init {
    self = [super init];
    if(self != nil) {
        //work your magic here
    }
    return self;
}

-(CGSize)newSize {
    CGSize newSize = self.frame.size;
    newSize.width /= 2.0f;
    newSize.height /= 1.5f;
    return newSize;
}

-(CGRect)newFrame {
    CGRect newFrame = self.frame;
    newFrame.size = [self newSize];
    return newFrame;
}

-(void)newShape {
    [self ellipse:self.frame];
}

-(void)resetShape {
    [self rect:self.frame];
}

@end
