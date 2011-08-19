//
//  LeftViewController.m
//  PanViews
//
//  Created by slim on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeftViewController.h"
#import "UIView+Orientation.h"

@interface LeftViewController()
@property(retain,nonatomic) UITableView * _tableView;
@end

@implementation LeftViewController
@synthesize _tableView;
- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    CGRect frame= [UIView getOrientationSizing];
    
    frame.size.width = 320;
    self._tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self._tableView.backgroundColor = [UIColor lightGrayColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect frame = [UIView getOrientationSizing];
//    NSLog(@"%@: %f %f", [UIView isOrienationPortait] ? @"port": @"land" ,frame.size.width, frame.size.height);
    CGRect tFrame = _tableView.frame;
    tFrame.size.height= frame.size.height;
    _tableView.frame = tFrame;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row ];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row clicked");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
