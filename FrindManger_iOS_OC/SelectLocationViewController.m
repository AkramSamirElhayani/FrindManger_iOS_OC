//
//  SelectLocationViewController.m
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 26/01/2022.
//

#import "SelectLocationViewController.h"
#import <MapKit/MapKit.h>
@interface SelectLocationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property CustomMapAnnotation *annotation;
@end

@implementation SelectLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)tapped:(id)sender {
    CGPoint touchP = [sender locationInView:self.mapView];
    CLLocationCoordinate2D touchL = [_mapView convertPoint:touchP toCoordinateFromView:_mapView];
    if(!(_annotation == nil)){
        [_mapView removeAnnotation:_annotation];
    }
   _annotation = [[CustomMapAnnotation alloc]init ];
   [_annotation setCoordinate:touchL];
   [_mapView addAnnotation:_annotation];
   [_selectButton setHidden:NO];
}
- (IBAction)selectLocationClicked:(id)sender {
    
    
    [_frindView setLocation:_annotation .coordinate];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
