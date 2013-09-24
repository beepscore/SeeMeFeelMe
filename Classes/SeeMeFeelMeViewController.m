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

#pragma mark Memory management
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
