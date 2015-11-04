//
//  FiltersViewController.h
//  YelpClone
//
//  Created by Steve Mitchell on 11/3/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "ViewController.h"

@class FiltersViewController;

@protocol FiltersViewControllerDelegate <NSObject>

- (void)FiltersViewController:(FiltersViewController *)filtersViewController didChangeFilters:(NSDictionary *)filters;

@end

@interface FiltersViewController : ViewController
@property (weak, nonatomic) id<FiltersViewControllerDelegate> delegate;
@end
