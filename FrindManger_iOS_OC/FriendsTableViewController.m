//
//  FriendsTableViewController.m
//  FrindManger_iOS_OC
//
//  Created by Akram Elhayani on 18/01/2022.
//

#import "FriendsTableViewController.h"
#import "Models/Friend.h"
#import "FriendViewController.h"
#import "ViewFriendViewController.h"
#import "ViewAllInMapViewController.h"
@interface FriendsTableViewController ()
{
    NSMutableArray<Friend*> *frinds ;
    
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    frinds = [NSMutableArray new ];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                            style:UIBarButtonItemStylePlain target:self
                                                           action:@selector(addPressed)];
    [self.navigationItem setRightBarButtonItem:btn];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) addPressed{
    FriendViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"friendView"];
    view.state = Adding;
    view.tableView = self;
    view.friends = frinds;
    [self.navigationController pushViewController:view animated:YES];
    
    
}
-(void)refreshDataSource{
    
    [self .tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [frinds count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[frinds objectAtIndex:indexPath.row] Name];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.imageView.image = [[frinds objectAtIndex:indexPath.row] Picture];
    cell.detailTextLabel.text =[[frinds objectAtIndex:indexPath.row] PhoneNumber];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
  
    [self editFriend:indexPath.row];
}
-(void) editFriend:(int)index{
    FriendViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"friendView"];
    view.state = Editing;
    view.tableView = self;
    view.friends = frinds;
    view.currentFrindIndex = index;
    [self.navigationController pushViewController:view animated:YES];
}

-(void) viewFriend:(int)index{
    ViewFriendViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewFriendView"];
     
    [view setFriend:[frinds objectAtIndex:index]] ;
  
    [self.navigationController pushViewController:view animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [frinds removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self viewFriend:indexPath.row];
}
- (IBAction)viewAllInMap:(id)sender {
    
    ViewAllInMapViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"viewInMapView"];
 
    view.friends = frinds;
    [self.navigationController pushViewController:view animated:YES];
    
}

@end
