//
//  LighIndicatorView.h
//  swift_lib
//
//  Created by jack ligh on 3/28/12.
//  Copyright (c) 2012 iTotemStudio. All rights reserved.
//

@import UIKit;

@interface LighIndicatorView : UIView

@property (retain, nonatomic) IBOutlet UIView *bgMaskView;

- (void)showInView:(UIView*)parentView;
- (void)hide;
@end
