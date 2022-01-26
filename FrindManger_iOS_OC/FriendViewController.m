//
//  FriendViewController.m
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 18/01/2022.
//

#import "FriendViewController.h"
#import "SelectLocationViewController.h"

@interface FriendViewController ()
{
    
    
    UIImagePickerController *imagePicker;
    UIImage *image;
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextEdit;
@property (weak, nonatomic) IBOutlet UITextField *AddressTextEdit;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTextEdit;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIImageView *frindPictureEdit;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *longit;
@property (weak, nonatomic) IBOutlet UITextField *latit;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(_state == Editing){
        Friend *friend = [_friends objectAtIndex:_currentFrindIndex];
        [self LoadDataFromFriend:friend];
        [_deleteButton setHidden:NO];
    }else{
        [_deleteButton setHidden:YES];
    }
    
}
- (IBAction)setLocationClicked:(id)sender {
    SelectLocationViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectLocationView"];
    view.frindView = self;
    [self.navigationController pushViewController:view animated:YES];
    
}
- (IBAction)SaveClicked:(UIButton *)sender {
    
    if(_state == Adding){
        Friend *friend = [Friend new ];
        [self LoadDataIntoFriend:friend];
        [self.friends addObject:friend];
        _currentFrindIndex = [self.friends count  ]-1;
        _state = Editing    ;
        [_deleteButton setHidden:NO];
    }else if(_state == Editing){
        Friend *friend = [_friends objectAtIndex:_currentFrindIndex];
        [self LoadDataIntoFriend:friend];
    }
    
    [self.tableView refreshDataSource];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)deleteClicked:(id)sender {
    
    [_friends removeObjectAtIndex:_currentFrindIndex];
    [self.tableView refreshDataSource];
    [self.navigationController popToRootViewControllerAnimated:YES ];
}
- (IBAction)selectImageClicked:(id)sender {
    imagePicker =  [UIImagePickerController new];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
-(void) imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *) info {
    image = [info  objectForKey:UIImagePickerControllerOriginalImage];
    self.frindPictureEdit.image = image;
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}
-(void)LoadDataIntoFriend:(Friend*)friend{
    friend .Name = _nameTextEdit.text;
    friend.Address = _AddressTextEdit.text;
    friend.PhoneNumber = _PhoneTextEdit.text;
    friend.Picture =   _frindPictureEdit.image ;
    friend.age     =      _age.text;
    friend.email =_email.text;
    friend.longitude= [_longit.text doubleValue];
    friend.latitude = [_latit.text doubleValue];
    
}
-(void)LoadDataFromFriend:(Friend*)friend{
    _nameTextEdit.text =  friend .Name ;
    _AddressTextEdit.text =    friend.Address ;
    _PhoneTextEdit.text =   friend.PhoneNumber ;
    _frindPictureEdit.image = friend.Picture;
    _age.text = friend.age;
    _email.text = friend.email;
    _longit.text = [[NSNumber numberWithDouble:friend.longitude] stringValue ];
    _latit.text = [[NSNumber numberWithDouble:friend.latitude] stringValue ];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)setLocation:(CLLocationCoordinate2D)point {
    _longit.text = [[NSNumber numberWithDouble:point.longitude ] stringValue];
    _latit.text = [[NSNumber numberWithDouble:point.latitude ] stringValue];
}

@end
