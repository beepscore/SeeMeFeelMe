//
//  DragView.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "DragView.h"

@implementation DragView

@synthesize delegate;
@synthesize dragViewSoundURL;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [dragViewSoundURL release], dragViewSoundURL = nil;

    [super dealloc];
}

- (void)playSound {
    [self.delegate playSoundAtURL:self.dragViewSoundURL];
}

@end
