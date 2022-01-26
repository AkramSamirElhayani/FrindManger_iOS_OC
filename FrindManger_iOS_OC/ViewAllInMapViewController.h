//
//  ViewAllInMapViewController.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import <UIKit/UIKit.h>
#import "Models/Friend.h"
#import "CutomMapAnnotation.h"
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ViewAllInMapViewController : UIViewController
@property NSMutableArray<Friend*> *friends;
@end

NS_ASSUME_NONNULL_END
