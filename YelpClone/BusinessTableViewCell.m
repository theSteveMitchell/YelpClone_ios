//
//  BusinessTableViewCell.m
//  YelpClone
//
//  Created by Steve Mitchell on 11/1/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "BusinessTableViewCell.h"

@implementation BusinessTableViewCell

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"awakeFromNib");
    self.previewImageView.layer.cornerRadius = 10.0f;
    self.previewImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
