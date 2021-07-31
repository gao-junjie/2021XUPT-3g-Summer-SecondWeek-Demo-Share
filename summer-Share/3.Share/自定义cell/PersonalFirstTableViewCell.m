//
//  PersonalFirstTableViewCell.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PersonalFirstTableViewCell.h"

@implementation PersonalFirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        _headPhotoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"realHeadPhoto.gif"]];
        [_headPhotoImageView.layer setMasksToBounds:YES];
        [_headPhotoImageView.layer setCornerRadius:12.0];
        [self.contentView addSubview:_headPhotoImageView];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"share柱哥";
        [_nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22]];
        [self.contentView addSubview:_nameLabel];
        
        _jobLabel = [[UILabel alloc] init];
        _jobLabel.text = @"OC之父/swift之父/高俊杰之儿";
        _jobLabel.font = [UIFont systemFontOfSize:13];
        _jobLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_jobLabel];
        
        _signatureLabel = [[UILabel alloc] init];
        _signatureLabel.text = @"csgo也阻挡不了我成为编程带师";
        _signatureLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_signatureLabel];
        
        _whatButton = [[UIButton alloc] init];
        [_whatButton setImage:[UIImage imageNamed:@"omg1.png"] forState:UIControlStateNormal];
        [_whatButton setTitle:@"86" forState:UIControlStateNormal];
        _whatButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_whatButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1] forState:UIControlStateNormal];
        _whatButton.enabled = NO;
        [self.contentView addSubview:_whatButton];
        
        
        _loveButton = [[UIButton alloc] init];
        [_loveButton setImage:[UIImage imageNamed:@"dianzan.png"] forState:UIControlStateNormal];
        [_loveButton setTitle:@"766" forState:UIControlStateNormal];
        _loveButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_loveButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1] forState:UIControlStateNormal];
        _loveButton.enabled = NO;
        [self.contentView addSubview:_loveButton];
        
        _visitorButton = [[UIButton alloc] init];
        [_visitorButton setImage:[UIImage imageNamed:@"fangwen.png"] forState:UIControlStateNormal];
        [_visitorButton setTitle:@"1042" forState:UIControlStateNormal];
        _visitorButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_visitorButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1] forState:UIControlStateNormal];
        _visitorButton.enabled = NO;
        [self.contentView addSubview:_visitorButton];
    }
    return self;
}

- (void)layoutSubviews {
    _headPhotoImageView.frame = CGRectMake(10, 10, 130, 130);
    _nameLabel.frame = CGRectMake(150, 15, 120, 30);
    _jobLabel.frame = CGRectMake(150, 40, 190, 30);
    _signatureLabel.frame = CGRectMake(150, 80, 260, 30);
    _loveButton.frame = CGRectMake(205, 120, 50, 30);
    _visitorButton.frame = CGRectMake(265, 120, 60, 30);
    _whatButton.frame = CGRectMake(145, 120, 50, 30);
}

@end
