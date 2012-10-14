//
//  TopicTitleCell.m
//  CaiXin
//
//  Created by Rainbow Zhang on 11/7/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import "TopicTitleCell.h"

@implementation TopicTitleCell
@synthesize titleLabel;
@synthesize updateLabel;
@synthesize selectImageView;
@synthesize cellLine;
@synthesize cellBottomLine;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected)
    {
        self.selectImageView.image = [UIImage imageNamed:@"dot_yellow.png"];
        self.updateLabel.text = @"";
    }
    else
    {
        self.selectImageView.image = [UIImage imageNamed:@"dot.png"];
    }
}

- (void)setTitle:(NSString *)title updateNum:(NSInteger)updateNum
{
    self.titleLabel.text = title;
    if (updateNum == 0) {
        self.updateLabel.text = @"";
    }
    else
    {
        self.updateLabel.text = [NSString stringWithFormat:@"%d", updateNum];
    }
    self.cellLine.hidden = NO;
    self.cellBottomLine.hidden = YES;
}

- (void)dealloc {
    [titleLabel release];
    [updateLabel release];
    [selectImageView release];
    [cellLine release];
    [cellBottomLine release];
    [super dealloc];
}
@end
