//
//  SeeMeFeelMeView.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/20/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "SeeMeFeelMeView.h"
#import "DragView.h"

@implementation SeeMeFeelMeView

@synthesize dragViewOne;


/*
 If you were to create the view programmatically, you would use initWithFrame:.
 You want to make sure the drag view is set up in this case as well (as in initWithCoder:).
 */
- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {

	}
	return self;
}


#pragma mark Memory management methods
- (void)dealloc {
    [dragViewOne release], dragViewOne = nil;
    [super dealloc];
}


#pragma mark UI
- (void)moveView:(UIView *)aView ForTouches:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
	
	// If the touch was in the dragView, move the dragView to its location
	if (aView == [touch view]) {
		CGPoint location = [touch locationInView:self];
		aView.center = location;		
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
    [self moveView:self.dragViewOne ForTouches:touches withEvent:event];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
    [self moveView:self.dragViewOne ForTouches:touches withEvent:event];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	self.dragViewOne.center = self.center;
	self.dragViewOne.transform = CGAffineTransformIdentity;
}

@end
