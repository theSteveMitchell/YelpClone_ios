//
//  BusinessTableViewCell.h
//  YelpClone
//
//  Created by Steve Mitchell on 11/1/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;

@end
