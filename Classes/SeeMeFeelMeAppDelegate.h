//
//  SeeMeFeelMeAppDelegate.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SeeMeFeelMeViewController;

@interface SeeMeFeelMeAppDelegate : NSObject <UIApplicationDelegate> {
    // Xcode automatically adds instance variables to back properties
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SeeMeFeelMeViewController *viewController;

@end

