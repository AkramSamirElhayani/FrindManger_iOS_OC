//
//  FrindViewProtocol.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
NS_ASSUME_NONNULL_BEGIN

@protocol FriendViewProtocol <NSObject>
-(void)setLocation:(CLLocationCoordinate2D)point;
@end

NS_ASSUME_NONNULL_END
