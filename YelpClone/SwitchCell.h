//
//  YelpSwitchTableViewCell.h
//  YelpClone
//
//  Created by Steve Mitchell on 11/3/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchCell;

@protocol SwitchCellDelegate <NSObject>

- (void)SwitchCell:(SwitchCell *)switchCell didUpdateValue:(BOOL)value;

@end

@interface SwitchCell : UITableViewCell
@property (nonatomic, assign) BOOL on;
@property (weak, nonatomic) id<SwitchCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISwitch *cellSwitch;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end
