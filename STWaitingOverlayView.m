//
//  STWaitingOverlayView.m
//
//  Created by Tom Whipple on 5/27/12.
//  Copyright (c) 2012 Smartovation Technologies, LLC. All rights reserved.
//

#import "STWaitingOverlayView.h"

@interface STWaitingOverlayView () {
  UIActivityIndicatorView* activityIndicator;
}
@end

@implementation STWaitingOverlayView

- (id)initWithFrame:(CGRect)frame
{
  
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.7;
  }
  return self;
}

- (void) layoutSubviews {
  [super layoutSubviews];
  
  if (!activityIndicator) {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  }
  if (![activityIndicator superview]) {
    activityIndicator.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self addSubview:activityIndicator];
  }
  [activityIndicator startAnimating];
}



@end
