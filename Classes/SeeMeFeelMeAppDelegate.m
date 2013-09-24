//
//  SeeMeFeelMeAppDelegate.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "SeeMeFeelMeAppDelegate.h"
#import "SeeMeFeelMeViewController.h"

@implementation SeeMeFeelMeAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after app launch
    self.window.rootViewController = self.viewController;
    [window makeKeyAndVisible];
    return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
