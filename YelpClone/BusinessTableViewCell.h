//
//  BusinessTableViewCell.h
//  YelpClone
//
//  Created by Steve Mitchell on 11/1/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YelpBusiness.h"

@interface BusinessTableViewCell : UITableViewCell
@property (nonatomic) YelpBusiness *business;
@end
