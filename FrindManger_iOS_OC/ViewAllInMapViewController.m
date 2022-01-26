//
//  ViewAllInMapViewController.m
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import "ViewAllInMapViewController.h"

@interface ViewAllInMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewAllInMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i =0 ; i< [_friends count]; i++) {
       
        Friend *friend = [_friends objectAtIndex:i];
        CustomMapAnnotation  *anno = [CustomMapAnnotation new ];
        CLLocationCoordinate2D cor =  CLLocationCoordinate2DMake(friend.latitude, friend.longitude);
        [anno setCoordinate:cor];
        [anno setTitle:friend.Name];
        [anno setSubtitle:friend.Address];
        [_mapView addAnnotation:anno];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
