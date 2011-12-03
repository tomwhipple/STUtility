//
//  ModalDelegate.h
//
//  Created by Tom Whipple on 1/26/11.
//  Copyright 2011 Smartovation Technologies, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol STModalDelegate <NSObject>

@optional 

-(void) modalViewControllerDidCancel:(UIViewController*)vc;

@required

-(void) modalViewControllerDidFinish:(UIViewController*)vc;

@end
