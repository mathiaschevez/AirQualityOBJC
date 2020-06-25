//
//  DMCCityAirQualityController.h
//  AirQualityOBJC
//
//  Created by Mathias on 6/24/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMCCityAirQuality.h"

NS_ASSUME_NONNULL_BEGIN

@interface DMCCityAirQualityController : NSObject

+(void) fetchSupportedCountries:(void (^) (NSArray<NSString *> *_Nullable))completion;

+(void) fetchSupportedStatesInCountry:(NSString *)country
                           completion:(void (^) (NSArray<NSString *>* _Nullable))completion;

+(void) fetchSupportedCitiesInState:(NSString *)country
                              state:(NSString *)state
                         completion:(void (^) (NSArray<NSString *>* _Nullable))completion;

+(void) fetchDataForCity:(NSString *)city
                   state:(NSString *)state
                 country:(NSString *)country
              completion:(void (^) (DMCCityAirQuality *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
