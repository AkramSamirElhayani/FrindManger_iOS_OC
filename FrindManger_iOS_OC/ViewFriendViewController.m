//
//  ViewFriendViewController.m
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import "ViewFriendViewController.h"
#import "MapKit/MapKit.h"
#import "CutomMapAnnotation.h"
@interface ViewFriendViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewFriend  ];
}
-(void)viewFriend{
   
    [self LoadDataFromFriend:_friend];
}
-(void)LoadDataFromFriend:(Friend*)friend{
    _name.text =  friend .Name ;
    _phone.text =   friend.PhoneNumber ;
    _image.image = friend.Picture;
    _age.text = friend.age;
    _email.text = friend.email;
     
    
    CustomMapAnnotation  *anno = [CustomMapAnnotation new ];
    CLLocationCoordinate2D cor =  CLLocationCoordinate2DMake(friend.latitude, friend.longitude);
    [anno setCoordinate:cor];
    [anno setTitle:friend.Name];
    [anno setSubtitle:friend.Address];
    [_mapView addAnnotation:anno];
     
}

@end
