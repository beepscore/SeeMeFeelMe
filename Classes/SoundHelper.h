//
//  SoundHelper.h
//  SeeMeFeelMe
//
//  Created by Steve Baker on 3/21/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
// need to import <DragViewSoundDelegate> protocol declaration
#import "DragView.h"


@interface SoundHelper : NSObject <DragViewSoundDelegate>

@end
