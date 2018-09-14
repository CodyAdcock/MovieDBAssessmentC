//
//  TMDBClient.h
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBClient : NSObject

+(void)searchForMovieWithSearchTerm:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<CRAMovie *> *_Nullable movie))block;

@end

NS_ASSUME_NONNULL_END
