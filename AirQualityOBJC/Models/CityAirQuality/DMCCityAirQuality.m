//
//  DMCCityAirQuality.m
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

#import "DMCCityAirQuality.h"
#import "DMCWeather.h"
#import "DMCPollution.h"

@implementation DMCCityAirQuality

- (instancetype)initWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(DMCWeather *)weather pollution:(DMCPollution *)pollution
{
    self = [super init];
    
    if (self) {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation DMCCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    NSDictionary *currentInfo = dictionary[@"current"];
    
    DMCWeather *weather = [[DMCWeather alloc] initWithDictionary:currentInfo[@"weather"]];
    DMCPollution *pollution = [[DMCPollution alloc] initWithDictionary:currentInfo[@"pollution"]];
    
    
    return [self initWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
