//
//  DragView.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "DragView.h"

@implementation DragView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


#pragma mark Memory management
- (void)dealloc {
    [_dragViewSoundURL release], _dragViewSoundURL = nil;
    [super dealloc];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)playSound {    
    [self.delegate dragView:self didRequestPlaySoundAtURL:self.dragViewSoundURL];
}


#pragma mark UI
// Move to the touch location
- (void)moveForTouch:(UITouch *)touch {
    
    CGPoint location = [touch locationInView:self.superview];
    self.center = location;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
    
    // Play a sound when view is tapped
    // Ref Dudney sec 18.3
    if (1 == touch.tapCount) {
        [self playSound];
    }	
	// Move the dragView to the touch location
    [self moveForTouch:touch];	
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
    // We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
	
	// Move the dragView to its location
    [self moveForTouch:touch];	
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

@end
