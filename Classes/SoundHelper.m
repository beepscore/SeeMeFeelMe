//
//  SoundHelper.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/21/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "SoundHelper.h"


@implementation SoundHelper


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
    NSLog(@"playSoundAtURL:");
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

@end
