//
//  SelectLocationViewController.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import <UIKit/UIKit.h>
#import "FrindViewProtocol.h"
#import "CutomMapAnnotation.h"
NS_ASSUME_NONNULL_BEGIN

@interface SelectLocationViewController : UIViewController
{}
@property (weak, nonatomic) id< FriendViewProtocol> frindView;
@end

NS_ASSUME_NONNULL_END
