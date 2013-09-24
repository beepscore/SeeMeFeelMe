//
//  main.m
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeeMeFeelMeAppDelegate.h"

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([SeeMeFeelMeAppDelegate class]));
    [pool release];
    return retVal;
}
