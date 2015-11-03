//
//  YelpSearchBar.m
//  YelpClone
//
//  Created by Steve Mitchell on 11/2/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "YelpSearchBar.h"

@implementation YelpSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%@", self.text);
}


@end
