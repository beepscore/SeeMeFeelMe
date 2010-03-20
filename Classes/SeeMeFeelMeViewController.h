//
//  SeeMeFeelMeViewController.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DragView.h"

@interface SeeMeFeelMeViewController : UIViewController {

#pragma mark instance variables
    DragView *dragOne;
    
}
#pragma mark properties
@property(nonatomic,retain) IBOutlet DragView *dragOne;

@end

