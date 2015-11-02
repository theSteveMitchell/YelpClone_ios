//
//  BusinessTableViewCell.m
//  YelpClone
//
//  Created by Steve Mitchell on 11/1/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "BusinessTableViewCell.h"
#import "UIImageview+AFNetworking.h"

@interface BusinessTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@end

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

- (void)setBusiness:(YelpBusiness *)business {
    _business = business;
    //NSLog(@"%@", [self.businesses[indexPath.row] imageUrl]);
    self.nameLabel.text = [_business name];
    
    NSURL *url = [_business imageUrl];
    [self.previewImageView setImageWithURL:url];
    
    NSURL *rateUrl = [_business ratingImageUrl];
    [self.ratingImageView setImageWithURL:rateUrl];
    
    self.distanceLabel.text = [_business distance];
    self.addressLabel.text = [_business address];
    self.categoryLabel.text = [_business categories];
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%@ Reviews", [_business reviewCount]];
}

@end
