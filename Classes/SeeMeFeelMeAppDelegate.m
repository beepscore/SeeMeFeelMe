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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after app launch
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
