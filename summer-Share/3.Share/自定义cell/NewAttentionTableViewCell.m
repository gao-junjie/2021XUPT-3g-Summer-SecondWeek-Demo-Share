//
//  NewAttentionTableViewCell.m
//  3.Share
//
//  Created by mac on 2021/7/29.
//  Copyright © 2021 mac. All rights reserved.
//

#import "NewAttentionTableViewCell.h"

@implementation NewAttentionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"attention"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _elseHeadPhotoImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_elseHeadPhotoImageView];
    
        _elseNameLabel = [[UILabel alloc] init];
        _elseNameLabel.textColor = [UIColor blackColor];
        _elseNameLabel.font = [UIFont systemFontOfSize:21];
        [self.contentView addSubview:_elseNameLabel];
        
        _deleteLabel = [[UILabel alloc] init];
        _deleteLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_deleteLabel];
        
        _attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionButton setImage:[UIImage imageNamed:@"guanzhu_normal.png"] forState:UIControlStateNormal];
        [_attentionButton setImage:[UIImage imageNamed:@"guanzhu_pressed.png"] forState:UIControlStateSelected];
        [_attentionButton addTarget:self action:@selector(pressAttentionButton:) forControlEvents:UIControlEventTouchUpInside];
        _attentionButton.selected = NO;
        [self.contentView addSubview:_attentionButton];
    }
    return self;

}

- (void)layoutSubviews {
    _elseHeadPhotoImageView.frame = CGRectMake(10, 5, 80, 80);
    _elseNameLabel.frame = CGRectMake(118, 28, 110, 35);
    _attentionButton.frame = CGRectMake(280, 35, 75, 30);
    _deleteLabel.frame = CGRectMake(10, 93, [UIScreen mainScreen].bounds.size.width - 20, 1);
}

- (void)pressAttentionButton:(UIButton*) button {
    if (button.selected == NO) {
        button.selected = YES;
    } else if (button.selected == YES) {
        button.selected = NO;
    }
}
@end
