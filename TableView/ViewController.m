//
//  ViewController.m
//  TableView
//
//  Created by Rostyslav Kobizsky on 8/5/15.
//  Copyright (c) 2015 Rostyslav Kobizsky. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldTableViewCell.h"
#import "SwitchTableViewCell.h"
#import "ASIHTTPRequest.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *countries;
//@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setCountries:(NSArray *)countries {
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"population" ascending:YES]];
    _countries = [countries sortedArrayUsingDescriptors:sortDescriptors];

    [self.tableView reloadData];
}


- (IBAction)refresh:(UIRefreshControl *)sender {
    NSLog(@"Wants refresh");
    
    [self downloadListOfCountries:^(id result) {
        [self.refreshControl endRefreshing];
        if ([result isKindOfClass:[NSError class]]) {
            //
        } else if ([result isKindOfClass:[NSData class]]) {
            NSError *error;
            self.countries = [NSJSONSerialization JSONObjectWithData:result options:0 error:&error];
        }

    }];
}

- (void)downloadListOfCountries:(void(^)(id result))completion {
    NSURL *url = [NSURL URLWithString:@"https://restcountries.eu/rest/v1/all"];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
    __weak typeof(request) wRequest = request;
    [request setCompletionBlock:^{
        if (completion) {
            completion(wRequest.responseData);
        }
    }];
    
    [request setFailedBlock:^{
        if (completion) {
            completion(wRequest.error);
        }
    }];
    
    [request setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        NSLog(@"Progress: %llu", size/total);
    }];
    
    [request startAsynchronous];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        static NSString *reuseIdentifier = @"Cell";
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        // Configure
        id countryObject = self.countries[indexPath.row];
        cell.textLabel.text = countryObject[@"name"];
        cell.detailTextLabel.text = [countryObject[@"population"] stringValue];
    }
    
    return cell;
}

@end
