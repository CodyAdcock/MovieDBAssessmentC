//
//  CRAMovie.h
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRAMovie : NSObject

@property (nonatomic, readonly, copy) NSString * title;
//Might Be a double/float. Comeback
@property (nonatomic, readonly, copy) NSNumber * rating;
@property (nonatomic, readonly, copy) NSString * summary;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
