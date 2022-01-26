//
//  Friend.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 18/01/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Friend : NSObject
{}

@property int ID ;
@property NSString* Name ;
@property UIImage* Picture;
@property NSString* Address;
@property NSString* PhoneNumber;
@property NSString* age;
@property NSString* email;
@property double longitude;
@property double latitude;
@property NSDate* DOB;

@end

NS_ASSUME_NONNULL_END
