//
//  DragView.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DragViewSoundDelegate;

@interface DragView : UIView {
    // Xcode automatically adds instance variables to back properties
}
#pragma mark properties
// Note: assign delegate, don't retain it
@property(nonatomic,weak)id <DragViewSoundDelegate> delegate;

// This property's type is an immutable value class that conforms to the NSCopying protocol,
// so use copy not retain
// Ref:  http://stackoverflow.com/questions/387959/nsstring-property-copy-or-retain
@property(nonatomic,copy)NSURL *dragViewSoundURL;

- (void)playSound;
@end

@protocol DragViewSoundDelegate
- (void)dragView:(DragView *)sender didRequestPlaySoundAtURL:(NSURL *)soundURL;
@end
