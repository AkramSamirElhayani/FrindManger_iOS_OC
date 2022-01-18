//
//  FriendViewController.h
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 18/01/2022.
//

#import <UIKit/UIKit.h>
#import "Models/Friend.h"
#import "TableViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN
enum ViewState{
    
    Adding ,
    Editing,
};

@interface FriendViewController : UIViewController<UIImagePickerControllerDelegate>
@property int currentFrindIndex;
@property NSMutableArray<Friend*> *friends;
@property enum  ViewState state ;
@property id <TableViewProtocol> tableView;
@end

 

NS_ASSUME_NONNULL_END
