//
//  DMCPollution.h
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMCPollution : NSObject

@property (nonatomic, readonly) NSInteger airQualityIndex;

-(instancetype) initWithInt:(NSInteger) aqi;

@end

@interface DMCPollution (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
