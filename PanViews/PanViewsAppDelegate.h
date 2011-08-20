//
//  PanViewsAppDelegate.h
//  PanViews
//
//  Created by slim on 8/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewContainer.h"
@class BaseViewContainer;

@interface PanViewsAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BaseViewContainer *viewController;


+(PanViewsAppDelegate *) instance;
-(ViewManager *) getViewManager;
-(UIView*) getBaseView;
@end
