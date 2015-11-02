//
//  ViewController.m
//  YelpClone
//
//  Created by Steve Mitchell on 10/31/15.
//  Copyright © 2015 Steve Mitchell. All rights reserved.
//

#import "ViewController.h"
#import "BusinessTableViewCell.h"
#import "YelpBusiness.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *businessTableView;
@property (strong, nonatomic) NSArray *businesses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.businessTableView.dataSource = self;
    self.businessTableView.delegate = self;
    [self fetchBusinesses];
}

- (void)fetchBusinesses {
    [YelpBusiness searchWithTerm:@"Restaurants"
                        sortMode:YelpSortModeBestMatched
                      categories:@[@"burgers"]
                           deals:NO
                      completion:^(NSArray *businesses, NSError *error) {
                          //for (YelpBusiness *business in businesses) {
                          //    NSLog(@"%@", business);
                         // /}
                          self.businesses = businesses;
                          [self.businessTableView reloadData];
                      }];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businesses.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessTableViewCell *cell = [self.businessTableView dequeueReusableCellWithIdentifier:@"businessCell"];
    cell.business = self.businesses[indexPath.row];
    //NSLog(@"%@", self.businesses[indexPath.row]);
    return cell;

}

@end
