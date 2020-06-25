//
//  DMCCityAirQuality.h
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DMCWeather;
@class DMCPollution;

NS_ASSUME_NONNULL_BEGIN

@interface DMCCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *state;
@property (nonatomic, copy, readonly) NSString *country;

@property (nonatomic, copy, readonly) DMCWeather *weather;
@property (nonatomic, copy, readonly) DMCPollution *pollution;
    
-(instancetype) initWithCity:(NSString *)city
                       state:(NSString *)state
                     country:(NSString *)country
                     weather:(DMCWeather *)weather
                   pollution:(DMCPollution *)pollution;

@end

@interface DMCCityAirQuality (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
