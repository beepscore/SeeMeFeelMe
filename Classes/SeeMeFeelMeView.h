//
//  SeeMeFeelMeView.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/20/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DragView;


@interface SeeMeFeelMeView : UIView {
#pragma mark instance variables
	DragView *dragViewOne;
}

#pragma mark properties
@property (nonatomic, retain) IBOutlet DragView *dragViewOne;

@end
