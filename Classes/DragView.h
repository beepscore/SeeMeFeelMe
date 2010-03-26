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
#pragma mark instance variables
    id <DragViewSoundDelegate> delegate;
    NSURL *dragViewSoundURL;
}
#pragma mark properties
// Note: assign delegate, don't retain it
@property(nonatomic,assign)id <DragViewSoundDelegate> delegate;

@property(nonatomic,retain)NSURL *dragViewSoundURL;

- (void)playSound;
@end

@protocol DragViewSoundDelegate
- (void)dragView:(DragView *)sender didRequestPlaySoundAtURL:(NSURL *)soundURL;
@end
