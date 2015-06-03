//
//  SloppySwiperNavigationController.m
//  PMS
//
//  Created by ligh on 14/11/11.
//
//

#import "SloppySwiperNavigationController.h"


@interface SloppySwiperNavigationController ()
{


}
@end

@implementation SloppySwiperNavigationController


-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController])
    {
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.navigationBarHidden = YES;
        SloppySwiper *swiper = [[SloppySwiper alloc] initWithNavigationController:self];
        [self setSloopySwiper:swiper];
    }
    
    return self;
}

-(void)setSloopySwiper:(SloppySwiper *)sloopySwiper
{
    if (_sloopySwiper!=sloopySwiper)
    {
        _sloopySwiper = nil;
        _sloopySwiper =  sloopySwiper;
 
        self.delegate = _sloopySwiper;
    }
}


-(void)setEnableSloppySwiper:(BOOL)enableSloppySwiper
{

}


@end
