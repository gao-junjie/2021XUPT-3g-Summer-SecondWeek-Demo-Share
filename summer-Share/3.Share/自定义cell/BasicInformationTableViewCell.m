//
//  BasicInformationTableViewCell.m
//  3.Share
//
//  Created by mac on 2021/7/30.
//  Copyright © 2021 mac. All rights reserved.
//

#import "BasicInformationTableViewCell.h"

@implementation BasicInformationTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"basic"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_tipLabel];
        
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_detailLabel];
        
        _deleteLabel = [[UILabel alloc] init];
        _deleteLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_deleteLabel];
    }
    return self;
}

- (void)layoutSubviews {
    _tipLabel.frame = CGRectMake(20, 15, 40, 30);
    _detailLabel.frame = CGRectMake(100, 15, 270, 30);
    _deleteLabel.frame = CGRectMake(10, 60, [UIScreen mainScreen].bounds.size.width - 20, 1);
}
@end
