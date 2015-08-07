//
//  SwitchTableViewCell.h
//  TableView
//
//  Created by Rostyslav Kobizsky on 8/5/15.
//  Copyright (c) 2015 Rostyslav Kobizsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *onoff;
@property (weak, nonatomic) IBOutlet UILabel *label;

+ (NSString *)reuseIdentifier;

@end
