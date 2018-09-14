//
//  TMDBClient.m
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import "TMDBClient.h"

@implementation TMDBClient

+(NSURL *)baseURL{
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/"];
}

+(void)searchForMovieWithSearchTerm:(NSString *)searchTerm withBlock:(void (^ _Nullable)(NSArray<CRAMovie *> *_Nullable movie))block{
    //Construct URL
    NSURL *url = [[[TMDBClient baseURL] URLByAppendingPathComponent:@"search"]URLByAppendingPathComponent:@"movie"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value:@"4367e8dd70236bd264e4b7a48d9abfdf"];
    NSURLQueryItem *search = [[NSURLQueryItem alloc]initWithName:@"query" value:searchTerm];
    
    urlComponents.queryItems = @[apiKey,search];
    
    NSURL *finishedURL = urlComponents.URL;
    NSLog(@"%@", finishedURL);
    
    //DataTask, Serialization, completion, and resume
    [[[NSURLSession sharedSession]dataTaskWithURL:finishedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        
        //Serializing. Like Decoding
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray *movieDictionaries = jsonDictionary[@"results"];
        NSMutableArray *movieArray = [[NSMutableArray alloc] init];
        
        //Fill our array of Dictionaries
        for (NSDictionary *movieDict in movieDictionaries){
            CRAMovie *movie = [[CRAMovie alloc]initWithDictionary:movieDict];
            [movieArray addObject:movie];
        }
        block(movieArray);
    }]resume];
    
}
@end
