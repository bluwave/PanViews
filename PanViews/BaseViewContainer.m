//
//  BaseViewContainer.m
//  PanViews
//
//  Created by slim on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseViewContainer.h"
#import "ViewManager.h"

@interface BaseViewContainer()
@property(retain, nonatomic) ViewManager * _viewManager;
@end

@implementation BaseViewContainer
@synthesize _viewManager;
- (void)dealloc
{
    [_viewManager dealloc];
    [super dealloc];
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
    self._viewManager= [[ViewManager alloc] initWithBaseView:self.view];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_viewManager notifyViewsOfRotationWithDuration:duration];
}

@end
