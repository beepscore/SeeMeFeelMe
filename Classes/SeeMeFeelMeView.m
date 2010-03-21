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


#pragma mark Sound play methods
// This function ends with };
// status callback function (notice this is a c function, not an obj-c method)
void SystemSoundsDemoCompletionProc (
                                     SystemSoundID  soundID,
                                     void           *clientData)
{
	AudioServicesDisposeSystemSoundID (soundID);
	// ((SystemSoundsDemoViewController*)clientData).statusLabel.text = @"Stopped";
};


// deluxe version with callbacks
// iPhone "system sound" file types must be uncompressed .aif, .caf, or .wav
// Some previous .caf files played on the simulator but not on an iPod, probably they were compressed.
// I used GarageBand to import the .caf files and export uncompressed .aif files.
- (void)playSoundAtURL:(NSURL *)soundURL {
    
	// create a system sound id
	SystemSoundID soundID;
    
	OSStatus err = kAudioServicesNoError;
    
    // find corresponding system sound file
    err = AudioServicesCreateSystemSoundID((CFURLRef) soundURL, &soundID);    
    
    if (err == kAudioServicesNoError) {
        // set up callback for sound completion
        err = AudioServicesAddSystemSoundCompletion
        (soundID,		// sound to monitor
         NULL,			// run loop (NULL==main)
         NULL,			// run loop mode (NULL==default)
         SystemSoundsDemoCompletionProc, // callback function
         self			// data to provide on callback
         );
        
        // statusLabel.text = @"Playing";
        AudioServicesPlaySystemSound (soundID);
    }
    
    if (err != kAudioServicesNoError) {
        CFErrorRef error = CFErrorCreate(NULL, kCFErrorDomainOSStatus, err, NULL);
        NSString *errorDesc = (NSString*) CFErrorCopyDescription (error);
        UIAlertView *cantPlayAlert =
        [[UIAlertView alloc] initWithTitle:@"Cannot Play:"
                                   message: errorDesc
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [cantPlayAlert show];
        [cantPlayAlert release]; 
        [errorDesc release];
        CFRelease (error);
    }    
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
            [self playSoundAtURL:soundURL];
        }
        if ([touch view] == self.dragViewTwo) {
            NSString *soundPath = 
            [[NSBundle mainBundle] pathForResource:@"SqueezeToy" ofType:@"aif"];
            NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
            [self playSoundAtURL:soundURL];
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
