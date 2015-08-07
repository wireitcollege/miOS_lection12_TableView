//
//  TextFieldTableViewCell.h
//  TableView
//
//  Created by Rostyslav Kobizsky on 8/5/15.
//  Copyright (c) 2015 Rostyslav Kobizsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextFieldTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

+ (NSString *)reuseIdentifier;

@end
