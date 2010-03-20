//
//  SeeMeFeelMeViewController.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "SeeMeFeelMeViewController.h"

@implementation SeeMeFeelMeViewController

#pragma mark properties
@synthesize dragOne;

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


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark memory management methods
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

// set properties to nil, which also releases them
- (void)setView:(UIView *)newView {
    if (nil == newView) {
        self.dragOne = nil;
    }    
    [super setView:newView];
}


- (void)dealloc {
    [dragOne release], dragOne = nil;
    
    [super dealloc];
}

// touchOneSet = [UIKit touchesForView:dragOne];
@end