//
//  PhotoTableViewCell.m
//  3.Share
//
//  Created by mac on 2021/7/28.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PhotoTableViewCell.h"

@implementation PhotoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"photo"]) {
        _photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _photoButton.backgroundColor = [UIColor whiteColor];
        [_photoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _photoButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _photoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, -58, 107);
        _photoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 200);
        [self.contentView addSubview:_photoButton];
        
        
        _themeLabel = [[UILabel alloc] init];
        _themeLabel.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
        _themeLabel.numberOfLines = 2;
        _themeLabel.backgroundColor = [UIColor clearColor];
        _themeLabel.textColor = [UIColor blackColor];
        _themeLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_themeLabel];


        _authorLabel = [[UILabel alloc] init];
        _authorLabel.backgroundColor = [UIColor clearColor];
        _authorLabel.textColor = [UIColor grayColor];
        _authorLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_authorLabel];


        _styleLabel = [[UILabel alloc] init];
        _styleLabel.backgroundColor = [UIColor clearColor];
        _styleLabel.textColor = [UIColor grayColor];
        _styleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_styleLabel];


        _loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loveButton.frame = CGRectMake(226, 138, 45, 20);
        
        [_loveButton setImage:[UIImage imageNamed:@"dianzan.png"] forState:UIControlStateNormal];
        [_loveButton setImage:[UIImage imageNamed:@"canceldianzan.png"] forState:UIControlStateSelected];
        _loveButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_loveButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [_loveButton addTarget:self action:@selector(pressLoveButton:) forControlEvents:UIControlEventTouchUpInside];
        _loveButton.selected = YES;
        [_photoButton addSubview:_loveButton];
        
        
        _visitorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _visitorButton.frame = CGRectMake(290, 137, 48, 23);
        
        _visitorButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_visitorButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [_visitorButton setImage:[UIImage imageNamed:@"fangwen.png"] forState:UIControlStateNormal];
        [_photoButton addSubview:_visitorButton];


        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_shareButton setTitleColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha:1] forState:UIControlStateNormal];
        [_shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [_photoButton addSubview:_shareButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    _photoButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 170);
    _themeLabel.frame = CGRectMake(230, 0, 180, 50);
    _authorLabel.frame = CGRectMake(230, 55, 180, 20);
    _styleLabel.frame = CGRectMake(230, 80, 180, 20);
    _shareButton.frame = CGRectMake(350, 137, 55, 23);
}

- (void)pressLoveButton:(UIButton*)button {
    if (button.selected == YES) {
        [button setSelected:NO];
    } else {
        [button setSelected:YES];
    }
}
@end
