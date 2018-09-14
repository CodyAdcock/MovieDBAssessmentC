//
//  CRAMovie.m
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import "CRAMovie.h"

@implementation CRAMovie

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self){
        _title = dictionary[@"title"];
        _rating = dictionary[@"vote_average"];
        _summary = dictionary[@"overview"];
    }
    return self;
}


@end
