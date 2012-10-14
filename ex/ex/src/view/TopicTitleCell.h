//
//  TopicTitleCell.h
//  CaiXin
//
//  Created by Rainbow Zhang on 11/7/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTitleCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel;
@property (retain, nonatomic) IBOutlet UIImageView *selectImageView;
@property (retain, nonatomic) IBOutlet UIImageView *cellLine;
@property (retain, nonatomic) IBOutlet UIImageView *cellBottomLine;





- (void)setTitle:(NSString *)title updateNum:(NSInteger)updateNum;

@end
