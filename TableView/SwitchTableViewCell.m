//
//  SwitchTableViewCell.m
//  TableView
//
//  Created by Rostyslav Kobizsky on 8/5/15.
//  Copyright (c) 2015 Rostyslav Kobizsky. All rights reserved.
//

#import "SwitchTableViewCell.h"

@implementation SwitchTableViewCell

+ (NSString *)reuseIdentifier {
    return @"Switch Cell";
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
