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
@synthesize dragViewTwo;


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
    [dragViewTwo release], dragViewTwo = nil;
    [super dealloc];
}


#pragma mark UI
// Move aView to the touch location
- (void)moveView:(UIView *)aView ForTouch:(UITouch *)touch {
    
	if (aView == [touch view]) {
		CGPoint location = [touch locationInView:self];
		aView.center = location;		
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
    
    // Play a sound when view is tapped
    // Ref Dudney sec 18.3
    if (1 == touch.tapCount) {
        if ([touch view] == self.dragViewOne) {
            NSString *soundPath = 
            [[NSBundle mainBundle] pathForResource:@"CartoonChipmunk" ofType:@"aif"];
            NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
            self.dragViewOne.dragViewSoundURL = soundURL;
            // FIXME:  this crashes program !!!!!!!!!!!!!!!!!!!!!!!!!!!!
            [self.dragViewOne playSound];
        }
        if ([touch view] == self.dragViewTwo) {
            NSString *soundPath = 
            [[NSBundle mainBundle] pathForResource:@"SqueezeToy" ofType:@"aif"];
            NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
            self.dragViewTwo.dragViewSoundURL = soundURL;
            [self.dragViewTwo playSound];
        }
    }
	
	// If the touch was in the dragView, move the dragView to its location
	if ([touch view] == self.dragViewOne) {
		[self moveView:self.dragViewOne ForTouch:touch];	
    }
	if ([touch view] == self.dragViewTwo) {
		[self moveView:self.dragViewTwo ForTouch:touch];	
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
    // We only support single touches, so anyObject retrieves just that touch from touches
	UITouch *touch = [touches anyObject];
	
	// If the touch was in the dragView, move the dragView to its location
	if ([touch view] == self.dragViewOne) {
		[self moveView:self.dragViewOne ForTouch:touch];	
    }
	if ([touch view] == self.dragViewTwo) {
		[self moveView:self.dragViewTwo ForTouch:touch];	
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

@end
