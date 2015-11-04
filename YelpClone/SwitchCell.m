//
//  YelpSwitchTableViewCell.m
//  YelpClone
//
//  Created by Steve Mitchell on 11/3/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "SwitchCell.h"

@interface SwitchCell ()

@end

@implementation SwitchCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)switchValueChanged:(id)sender {
    [self.delegate SwitchCell:self didUpdateValue:self.cellSwitch.on];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated{
    
}


@end
