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
#import "YelpSearchBar.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *businessTableView;
@property (strong, nonatomic) NSArray *businesses;
@property (strong, nonatomic) NSString *searchTerm;
@property (strong, nonatomic) UISearchBar * searchBar;
@property (weak, nonatomic) IBOutlet UIButton *filtersButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _filtersButton.frame = CGRectMake(10, 0, 50, 30);
    //button setTitle:@"Filters" forState:UIControlStateNormal];
    //button.layer.borderColor = [UIColor whiteColor].CGColor;
    //button.layer.borderWidth = 0.3f;
    //button.layer.cornerRadius = 3;
    _filtersButton.clipsToBounds = YES;
    //[button addTarget:self action:@selector(goToFiltersController) forControlEvents:UIControlEventTouchUpInside];
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
    //_searchBar.showsCancelButton = YES;
    [self.searchBar sizeToFit];
    self.navigationItem.titleView = _searchBar;
    self.businessTableView.dataSource = self;
    self.businessTableView.delegate = self;
    _searchTerm = @"";
    [self fetchBusinesses];
}

- (void)fetchBusinesses {
    [YelpBusiness searchWithTerm:_searchTerm
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

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    _searchBar.showsCancelButton = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    // trigger fetch when search tem is 3 or more characters.
    // But if there was a previous search, we trigger fetch to clear filtering.
    int previousTermCancelled = (![searchText containsString:_searchTerm] && _searchTerm.length > 0);
    NSLog(@"contains: %d", previousTermCancelled);
    NSLog(@"old: %@", _searchTerm);
    NSLog(@"new: %@", searchText);
    
    _searchTerm = searchText;
    if (_searchTerm.length >= 3 || previousTermCancelled)
    {
        [self fetchBusinesses];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _searchBar.showsCancelButton = NO;
    _searchTerm = _searchBar.text;
    [self fetchBusinesses];
    [_searchBar resignFirstResponder];
};

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _searchBar.showsCancelButton = NO;
    _searchBar.text = @"";
    _searchTerm = _searchBar.text;
    [self fetchBusinesses];
    [_searchBar resignFirstResponder];
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businesses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessTableViewCell *cell = [self.businessTableView dequeueReusableCellWithIdentifier:@"businessCell"];
    cell.business = self.businesses[indexPath.row];
    //NSLog(@"%@", self.businesses[indexPath.row]);
    return cell;

}

@end
