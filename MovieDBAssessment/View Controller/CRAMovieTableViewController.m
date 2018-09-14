//
//  CRAMovieTableViewController.m
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import "CRAMovieTableViewController.h"

@interface CRAMovieTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation CRAMovieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    
}

//DidSet
-(void)setMovies:(NSArray<CRAMovie *>*) movies{
    _movies = movies;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self tableView]reloadData];
    });
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [TMDBClient searchForMovieWithSearchTerm:searchText withBlock:^(NSArray<CRAMovie *> * _Nullable movie) {
        self.movies = movie;
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SwiftMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    CRAMovie *movie = self.movies[indexPath.row];
    cell.movie = movie;
    return cell;
}

//set cell height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{return 200;}

@end
