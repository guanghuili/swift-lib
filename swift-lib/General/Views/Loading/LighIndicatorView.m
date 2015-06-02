//
//  LighIndicatorView.m
//  swift_lib
//
//  Created by jack ligh on 3/28/12.
//  Copyright (c) 2012 iTotemStudio. All rights reserved.
//

#import "LighIndicatorView.h"

@implementation LighIndicatorView

- (void)awakeFromNib{
    [super awakeFromNib];
    _bgMaskView.layer.masksToBounds = YES;
    _bgMaskView.layer.cornerRadius = 5;
}
- (void)showInView:(UIView*)parentView{
    self.frame = parentView.bounds;
    self.alpha = 0;
    [parentView addSubview:self];
    [UIView animateWithDuration:0.3 
                     animations:^{
                         self.alpha = 1;
                     } 
                     completion:^(BOOL finished) {
                         //
                     }];
}
- (void)hide{
    [UIView animateWithDuration:0.3 
                     animations:^{
                         self.alpha = 0;
                     } 
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}
@end
