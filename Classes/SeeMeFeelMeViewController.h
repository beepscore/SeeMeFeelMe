//
//  SeeMeFeelMeViewController.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/19/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//  Ref Apple sample code MoveMe
//  Ref Stanford iPhone class winter 2010 lecture 14 (more complicated than MoveMe, didn't use)
//  Ref Dudney iPhone SDK Development Ch 18 Draw, Ch 17 Core Audio

#import <UIKit/UIKit.h>
@class DragView;

@interface SeeMeFeelMeViewController : UIViewController

#pragma mark properties
@property (nonatomic, strong) IBOutlet DragView *dragViewOne;
@property (nonatomic, strong) IBOutlet DragView *dragViewTwo;

@end

