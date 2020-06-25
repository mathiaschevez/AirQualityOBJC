//
//  DMCPollution.m
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

#import "DMCPollution.h"

@implementation DMCPollution

-(instancetype)initWithInt:(NSInteger)aqi
{
    self = [super init];
    
    if (self)
    {
        _airQualityIndex = aqi;
    }
    return self;
}

@end

@implementation DMCPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger aqi = [dictionary[@"aquis"] intValue];
    
    return [self initWithInt:aqi];
}

@end
