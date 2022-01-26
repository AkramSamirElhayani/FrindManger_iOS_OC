//
//  CutomMapAnnotation.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomMapAnnotation : NSObject<MKAnnotation>
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate; 

@end
 
