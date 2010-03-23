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


- (void)setUpDragViews {
    
//    NSString *soundPathOne = [[NSBundle mainBundle] 
//                              pathForResource:@"CartoonChipmunk" ofType:@"aif"];
//    NSURL *soundURLOne = [NSURL fileURLWithPath:soundPathOne];
//    self.dragViewOne.dragViewSoundURL = soundURLOne;
//    
//    NSString *soundPathTwo = [[NSBundle mainBundle] 
//                              pathForResource:@"CartoonChipmunk" ofType:@"aif"];
//    NSURL *soundURLTwo = [NSURL fileURLWithPath:soundPathTwo];
//    self.dragViewTwo.dragViewSoundURL = soundURLTwo;

}


/*
 If the view is stored in the nib file, when it's unarchived it's sent -initWithCoder:.
 This is the case in the example as provided.  See also initWithFrame:.
 */
- (id)initWithCoder:(NSCoder *)coder {
	
	if (self = [super initWithCoder:coder]) {
		[self setUpDragViews];
	}
	return self;
}


/*
 If you were to create the view programmatically, you would use initWithFrame:.
 You want to make sure the placard view is set up in this case as well (as in initWithCoder:).
 */
- (id)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setUpDragViews];
	}
	return self;
}


#pragma mark Memory management methods
- (void)dealloc {
    [dragViewOne release], dragViewOne = nil;
    [dragViewTwo release], dragViewTwo = nil;
    [super dealloc];
}

@end
