//
//  SeeMeFeelMeViewController.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "SeeMeFeelMeViewController.h"
#import "DragView.h"

@implementation SeeMeFeelMeViewController

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"SeeMeFeelMeViewController viewDidLoad");
    
    NSString *soundPathOne = [[NSBundle mainBundle] 
                              pathForResource:@"CartoonChipmunk" ofType:@"caf"];
    NSURL *soundURLOne = [NSURL fileURLWithPath:soundPathOne];
    self.dragViewOne.dragViewSoundURL = soundURLOne;
    
    NSString *soundPathTwo = [[NSBundle mainBundle] 
                              pathForResource:@"SqueezeToy" ofType:@"caf"];
    NSURL *soundURLTwo = [NSURL fileURLWithPath:soundPathTwo];
    self.dragViewTwo.dragViewSoundURL = soundURLTwo;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

#pragma mark Memory management
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


// Ref http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmNibObjects.html
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
    // Release any retained outlets
    // set properties to nil, which also releases them
    self.soundHelper = nil;
    self.dragViewOne = nil;
    self.dragViewTwo = nil;
    
    [super viewDidUnload];
}

@end
