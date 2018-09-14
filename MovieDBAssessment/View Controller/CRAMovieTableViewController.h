//
//  CRAMovieTableViewController.h
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRAMovie.h"
#import "TMDBClient.h"
#import "MovieDBAssessment-Swift.h"


NS_ASSUME_NONNULL_BEGIN

@interface CRAMovieTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic,readwrite) NSArray<CRAMovie *> *movies;

@end

NS_ASSUME_NONNULL_END
